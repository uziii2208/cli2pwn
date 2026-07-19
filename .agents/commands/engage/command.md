# `/engage`

The `/engage` command initializes a targeted red team operation against a specified scope. It automatically loads relevant skills, starts the logging hook, and primes the OPSEC environment.

## Usage
`/engage <target> [flags]`

## Examples
- `/engage 10.10.10.0/24 --mode stealth`
- `/engage corp.local --agent active_directory`

## Behavior
1. Triggers `session_prime.sh` to secure the local environment.
2. Runs `scope_check.py` against the target.
3. Invokes the specified agent(s) and begins initial reconnaissance.
