#!/usr/bin/env python3
import sys
import json
import ipaddress
import re

def is_in_scope(target, allowed_scopes):
    for scope in allowed_scopes:
        if "*" in scope:
            pattern = scope.replace(".", r"\.").replace("*", ".*")
            if re.match(f"^{pattern}$", target):
                return True
        try:
            if ipaddress.ip_address(target) in ipaddress.ip_network(scope):
                return True
        except ValueError:
            pass
        if target == scope:
            return True
    return False

def main():
    if len(sys.argv) < 2:
        print("Usage: scope_check.py <target_json_payload>")
        sys.exit(1)
    
    payload = json.loads(sys.argv[1])
    target = payload.get("target")
    config_scopes = payload.get("allowed_scopes", [])
    
    if is_in_scope(target, config_scopes):
        print(json.dumps({"status": "allowed", "reason": "Target within defined ROE."}))
        sys.exit(0)
    else:
        print(json.dumps({"status": "blocked", "reason": "Target OUT OF SCOPE. Execution halted."}))
        sys.exit(1)

if __name__ == "__main__":
    main()
