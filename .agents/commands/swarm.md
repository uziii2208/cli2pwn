# `/swarm`

The `/swarm` command orchestrates multiple subagents concurrently to tackle complex, multi-domain environments (e.g., AD + Cloud + Web).

## Usage
`/swarm <objective>`

## Examples
- `/swarm "Compromise the internal network and locate the AWS billing keys"`
- `/swarm "Execute a full kill-chain on the web app and pivot to backend databases"`

## Behavior
1. The planner agent breaks down the objective.
2. Invokes `web_assassin`, `cloud_attacker`, and `active_directory` agents as needed.
3. Agents communicate via shared state and cross-pollinate findings.
