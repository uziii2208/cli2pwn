#!/bin/bash
# CLI2PWN Advanced Command Logger
# Captures executing command, environment state, and temporal data

LOG_DIR="${HOME}/.cli2pwn/logs/$(date +%Y%m%d)"
mkdir -p "$LOG_DIR"

CMD_ID=$(uuidgen)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
SESSION_ID=${CLI2PWN_SESSION:-"standalone"}
AGENT=${CLI2PWN_AGENT:-"manual"}

cat <<EOF >> "$LOG_DIR/cmd_history.json"
{
  "cmd_id": "$CMD_ID",
  "timestamp": "$TIMESTAMP",
  "session": "$SESSION_ID",
  "agent": "$AGENT",
  "pwd": "$(pwd)",
  "command": "$@",
  "user": "$(whoami)"
}
EOF

# Pass execution forward
exec "$@"
