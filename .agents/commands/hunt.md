# `/hunt`

The `/hunt` command directs the agent to specifically search for a particular type of data, vulnerability, or misconfiguration across the current compromised scope.

## Usage
`/hunt <target_type>`

## Examples
- `/hunt passwords`
- `/hunt "exposed git repositories"`
- `/hunt "unquoted service paths"`

## Behavior
1. Queries the `ttp_suggester.py` for relevant techniques.
2. Executes broad, low-and-slow searches.
3. Feeds results back into the collective findings graph.
