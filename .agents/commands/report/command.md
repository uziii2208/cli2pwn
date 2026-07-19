# `/report`

The `/report` command triggers the `report_writer` agent to synthesize all logged commands, synced findings, and objective progress into a professional red team deliverable.

## Usage
`/report [format]`

## Examples
- `/report markdown`
- `/report json --executive-summary`

## Behavior
1. Parses `~/.cli2pwn/logs/` and the sqlite findings database.
2. Maps all actions to MITRE ATT&CK tactics and techniques.
3. Generates a comprehensive markdown artifact with attack narratives.
