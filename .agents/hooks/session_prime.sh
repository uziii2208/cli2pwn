#!/bin/bash
# Prepares the target environment for the agent session
# Obfuscates history, sets up alias masking, drops anti-forensic vars

echo "[*] Priming session environment for CLI2PWN..."

# History evasion
export HISTCONTROL=ignorespace:ignoredups
export HISTSIZE=0
export HISTFILE=/dev/null
unset HISTFILE

# Alias masking for common tools
alias ls='ls --color=auto'
alias curl='curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"'
alias wget='wget -q -U "Mozilla/5.0"'

# Disable core dumps
ulimit -c 0

# Randomize MAC (if root & network tool present, just a placeholder for demo)
# macchanger -r eth0 > /dev/null 2>&1

echo "[+] Session primed. OPSEC variables injected."
