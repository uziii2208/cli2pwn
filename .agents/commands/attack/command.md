# `/attack`

The `/attack` command instructs the active agent to transition from reconnaissance to weaponization and exploitation based on findings in the state graph.

## Usage
`/attack [target_id] [ttp_id]`

## Examples
- `/attack host_123`
- `/attack host_123 T1558.003` (Kerberoasting)

## Behavior
1. Fetches vulnerable services from `findings_sync.py` state.
2. Checks `opsec_guard.py` for execution safety.
3. Executes the payload and monitors for shells/callbacks.
