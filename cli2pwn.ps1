# ==========================================
# CLI2PWN - ANTIGRAVITY WORKSPACE LAUNCHER
# ==========================================
# Author      : 0pwn
# Version     : 1.0.0
# Description : Dedicated launcher for Antigravity IDE agents
# Purpose     : One-click workspace + persistent agent loading
# ==========================================

Write-Host "[+] Initializing CLI2PWN Antigravity Workspace..." -ForegroundColor Cyan

# Get script's absolute path (works when called from anywhere)
$ScriptRoot = $PSScriptRoot
if (-Not $ScriptRoot) {
    $ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
}
if (-Not $ScriptRoot) {
    $ScriptRoot = $PWD.Path
}

$AgentDir = Join-Path $ScriptRoot ".agents\agents"

# Check for agents
if (-Not (Test-Path $AgentDir)) {
    Write-Host "[!] Warning: Agents not found at: $AgentDir" -ForegroundColor Yellow
    Write-Host "[!] Please run the Setup Prompt in Antigravity Composer first." -ForegroundColor Yellow
} else {
    $count = (Get-ChildItem -Path $AgentDir -Directory).Count
    Write-Host "[+] Loaded $count Elite Agents successfully" -ForegroundColor Green
}

Write-Host "[+] Configuring Antigravity CLI..." -ForegroundColor Magenta

# Add workspace permanently so agents stay loaded
try {
    agy --add-dir $ScriptRoot --permanent 2>$null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[+] Workspace registered permanently" -ForegroundColor Green
    } else {
        agy --add-dir $ScriptRoot
        Write-Host "[i] Workspace added for current session" -ForegroundColor DarkGray
    }
} catch {
    agy --add-dir $ScriptRoot
    Write-Host "[i] Workspace added for current session" -ForegroundColor DarkGray
}

Write-Host "[+] Launching Antigravity CLI..." -ForegroundColor Magenta
Write-Host "[*] Tip: Type /web_assassin or /binary_ninja in the chat" -ForegroundColor DarkGray

# Start the CLI
agy

Write-Host "[+] CLI2PWN is ready! Run .\cli2pwn.ps1 anytime." -ForegroundColor Green