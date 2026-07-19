#!/usr/bin/env python3
# Analyzes context and injects relevant MITRE ATT&CK TTP suggestions for the agent
import json
import sys

TTP_MAP = {
    "smb": [{"id": "T1021.002", "desc": "SMB/Windows Admin Shares"}, {"id": "T1059.001", "desc": "PowerShell"}],
    "k8s": [{"id": "T1609", "desc": "Container Administration Command"}, {"id": "T1525", "desc": "Implant Internal Image"}],
    "aws": [{"id": "T1078.004", "desc": "Cloud Accounts"}, {"id": "T1528", "desc": "Steal Application Access Token"}]
}

def suggest(context):
    suggestions = []
    for key, val in TTP_MAP.items():
        if key in context.lower():
            suggestions.extend(val)
    return suggestions

if __name__ == "__main__":
    context = " ".join(sys.argv[1:])
    suggs = suggest(context)
    if suggs:
        print("💡 TTP Suggestions based on context:")
        for s in suggs:
            print(f"  - {s['id']}: {s['desc']}")
        print(json.dumps({"action": "inject_prompt", "content": f"Consider exploring these TTPs: {suggs}"}))
