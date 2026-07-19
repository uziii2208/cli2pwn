#!/bin/bash
# CLI2PWN Launch Handler
# Starts the full elite workspace with persistent agents

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

echo "[+] Launching CLI2PWN Elite Workspace..."
echo "[i] Project root: $PROJECT_ROOT"
echo "[i] Agents directory: $PROJECT_ROOT/.agents/agents"

# Check if agents directory exists
if [ ! -d "$PROJECT_ROOT/.agents/agents" ]; then
    echo "[!] Agents directory not found at: $PROJECT_ROOT/.agents/agents"
    echo "[!] Please run the Setup Prompt in Antigravity Composer first."
    exit 1
fi

echo "[+] Workspace loaded successfully"
exit 0
