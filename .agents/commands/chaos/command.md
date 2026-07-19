# `/chaos`

The `/chaos` command instructs the agents to adopt an aggressive, noisy posture. OPSEC guardrails are temporarily lifted, and the goal is maximum disruption or simulation of an advanced persistent but noisy threat (e.g., ransomware simulation).

## Usage
`/chaos [duration]`

## Examples
- `/chaos 10m`
- `/chaos --simulate-ransomware`

## Behavior
1. Temporarily disables `opsec_guard.py`.
2. Employs aggressive scanners (masscan, bloodhound all).
3. Focuses on speed and coverage over stealth.
