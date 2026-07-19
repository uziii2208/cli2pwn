#!/usr/bin/env python3
# Syncs agent findings to a centralized state graph
import json
import sqlite3
import datetime
import sys
import os

DB_PATH = os.path.expanduser("~/.cli2pwn/state/findings.db")

def init_db():
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS findings
                 (id TEXT PRIMARY KEY, timestamp TEXT, category TEXT, 
                  severity TEXT, host TEXT, data TEXT)''')
    conn.commit()
    return conn

def sync_finding(finding):
    conn = init_db()
    c = conn.cursor()
    finding_id = finding.get("id", os.urandom(8).hex())
    c.execute("INSERT OR REPLACE INTO findings VALUES (?, ?, ?, ?, ?, ?)",
              (finding_id,
               datetime.datetime.utcnow().isoformat(),
               finding.get("category", "unknown"),
               finding.get("severity", "info"),
               finding.get("host", "global"),
               json.dumps(finding.get("data", {}))))
    conn.commit()
    print(f"[+] Finding {finding_id} synced to collective graph.")

if __name__ == "__main__":
    raw_data = sys.stdin.read()
    try:
        data = json.loads(raw_data)
        sync_finding(data)
    except json.JSONDecodeError:
        print("[-] Invalid finding format. Expected JSON via stdin.", file=sys.stderr)
        sys.exit(1)
