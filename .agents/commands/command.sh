#!/bin/bash
# CLI2PWN Command Handler
# Executes system commands with proper output handling

set -euo pipefail

if [[ $# -eq 0 ]]; then
    echo "[!] No command provided"
    echo "Usage: /command <your_command_here>"
    exit 1
fi

# Execute the provided command
"$@"
exit $?
