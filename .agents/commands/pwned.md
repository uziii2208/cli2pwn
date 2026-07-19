# `/pwned`

The `/pwned` command is used when a significant compromise has occurred (e.g., Domain Admin achieved, critical data accessed). It locks in the state, captures proof of execution, and alerts the operator.

## Usage
`/pwned <loot_description>`

## Examples
- `/pwned "Got DA via constrained delegation"`
- `/pwned "Dumped AWS secrets from metadata service"`

## Behavior
1. Logs the critical finding with high priority.
2. Automatically extracts loot, hashes, and tokens to the loot directory.
3. Pauses aggressive actions to avoid burning the high-value access.
