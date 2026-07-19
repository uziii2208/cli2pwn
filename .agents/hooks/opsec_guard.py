#!/usr/bin/env python3
# CLI2PWN OPSEC Guard
# Intercepts commands and blocks known noisy/dangerous patterns unless overridden
import sys
import re
import json

BLOCKED_PATTERNS = [
    r"nmap\s+-T[45]",               # Noisy scanning
    r"masscan",                     # Aggressive scanning
    r"sqlmap",                      # Super noisy
    r"curl\s+.*(pastebin|ngrok)",   # Suspicious exfil
    r"ping\s+-c\s+[0-9]{3,}",       # Long pings
]

def check_opsec(cmd):
    for pattern in BLOCKED_PATTERNS:
        if re.search(pattern, cmd, re.IGNORECASE):
            return False, pattern
    return True, None

if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(0)
    
    cmd = " ".join(sys.argv[1:])
    safe, matched = check_opsec(cmd)
    
    if not safe:
        res = {
            "status": "BLOCKED",
            "reason": f"OPSEC violation. Matched noisy pattern: {matched}",
            "remediation": "Use stealthier alternatives or append --opsec-override if explicitly authorized."
        }
        print(json.dumps(res))
        sys.exit(1)
        
    print(json.dumps({"status": "SAFE"}))
    sys.exit(0)
