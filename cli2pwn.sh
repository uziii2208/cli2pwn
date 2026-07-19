#!/usr/bin/env bash
set -euo pipefail

if [[ -f "$0" ]]; then
    chmod +x "$0" 2>/dev/null || true
fi

printf '[+] Initializing CLI2PWN Antigravity Workspace...\n'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_DIR="$SCRIPT_DIR/.agents/agents"

if [ ! -d "$AGENT_DIR" ]; then
    printf '[!] Warning: Agents not found at: %s\n' "$AGENT_DIR"
    printf '[!] Please run the Setup Prompt in Antigravity Composer first.\n'
else
    count=$(find "$AGENT_DIR" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
    printf '[+] Loaded %s Elite Agents successfully\n' "$count"
fi

printf '[+] Configuring Antigravity CLI...\n'

if ! command -v agy >/dev/null 2>&1; then
    printf '[!] Antigravity CLI (agy) was not found in PATH.\n'
    printf '[!] Install Antigravity CLI and ensure it is available before running this script.\n'
    exit 1
fi

if agy --add-dir "$SCRIPT_DIR" --permanent >/dev/null 2>&1; then
    printf '[+] Workspace registered permanently\n'
else
    agy --add-dir "$SCRIPT_DIR" >/dev/null 2>&1 || true
    printf '[i] Workspace added for current session\n'
fi

printf '[+] Launching Antigravity CLI...\n'
printf '[*] Tip: Type /web_assassin or /binary_ninja in the chat\n'

agy

printf '[+] CLI2PWN is ready! Run ./cli2pwn.sh anytime!\n'
