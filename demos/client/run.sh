#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail

run_connection() {
    local server=$1 client=$2 text=$3
    local temporary server_pid= client_pid= client_status=0 server_status=0 status=0
    temporary=$(mktemp -d)

    cleanup() {
        trap - EXIT HUP INT TERM
        if [[ -n "$client_pid" ]]; then
            kill -KILL "$client_pid" 2>/dev/null || true
            wait "$client_pid" 2>/dev/null || true
        fi
        if [[ -n "$server_pid" ]]; then
            kill -KILL "$server_pid" 2>/dev/null || true
            wait "$server_pid" 2>/dev/null || true
        fi
        rm -rf -- "$temporary"
    }
    trap cleanup EXIT
    trap 'exit 129' HUP
    trap 'exit 130' INT
    trap 'exit 143' TERM

    mkfifo "$temporary/requests" "$temporary/responses"
    "$server" < "$temporary/requests" > "$temporary/responses" &
    server_pid=$!
    # Open the request writer first, pairing with the server's request reader.
    # The opposite redirection order would leave both processes waiting to read.
    "$client" "$text" > "$temporary/requests" < "$temporary/responses" &
    client_pid=$!

    wait "$client_pid" || client_status=$?
    client_pid=
    if (( client_status != 0 )); then
        cleanup
        return 1
    fi
    # Closing the client's request writer delivers EOF to the server.
    wait "$server_pid" || server_status=$?
    server_pid=
    (( client_status == 0 && server_status == 0 )) || status=1
    cleanup
    return "$status"
}

# A separate Bash process lets GNU timeout bound the complete exchange and
# signal the process group, including peers blocked while opening their FIFOs.
if [[ ${1-} == --internal-run ]]; then
    shift
    run_connection "$@"
    exit
fi

usage() {
    cat <<'EOF'
Usage: run.sh [--server PATH] [--client PATH] [--timeout SECONDS] [--] [TEXT]

Run the Ada client and server over stdio. The timeout defaults to 10 seconds.
TEXT defaults to "Привіт з Ada!". Requires Bash and GNU timeout.
EOF
}

fail() {
    printf '%s\n' "$*" >&2
    exit 2
}

directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
server="$directory/../server/bin/mcp_demo"
client="$directory/bin/mcp_client_demo"
deadline=10
text='Привіт з Ada!'
has_text=false

while (( $# )); do
    case $1 in
        --server|--client|--timeout)
            (( $# >= 2 )) || fail "Missing value for $1"
            case $1 in
                --server) server=$2 ;;
                --client) client=$2 ;;
                --timeout) deadline=$2 ;;
            esac
            shift 2
            ;;
        --server=*) server=${1#*=}; shift ;;
        --client=*) client=${1#*=}; shift ;;
        --timeout=*) deadline=${1#*=}; shift ;;
        -h|--help) usage; exit 0 ;;
        --)
            shift
            (( $# <= 1 )) || fail 'Expected at most one TEXT argument'
            if (( $# )); then
                $has_text && fail 'Expected at most one TEXT argument'
                text=$1
            fi
            break
            ;;
        -*) fail "Unknown option: $1 (use -- before TEXT starting with '-')" ;;
        *)
            $has_text && fail 'Expected at most one TEXT argument'
            text=$1
            has_text=true
            shift
            ;;
    esac
done

[[ $deadline =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ && -n ${deadline//[.0]/} ]] \
    || fail '--timeout must be a positive number of seconds'
for executable in "$server" "$client"; do
    [[ -f "$executable" && -x "$executable" ]] \
        || fail "Executable missing or not executable: $executable. Build both demos first."
done
command -v timeout >/dev/null || fail 'GNU timeout is required to run the demos'

exec timeout --kill-after=1s "${deadline}s" \
    "$BASH" "$directory/run.sh" --internal-run "$server" "$client" "$text"
