---
Title: rhino03 maintenance on February 3
---

As part of the [E2 Data Center Work](/_scicompannounce/2025-12-07-e2-data-center-work) scheduled for
February 3, 2026, `rhino03` will be temporarily offline. In preparation, we have set login restrictions
to limit access to those users with existing sessions.

- `rhino01` and `rhino02` will NOT be impacted by this maintenance
- If you use `ssh rhino` to connect, you will be automatically routed to either `rhino01` or `rhino02`
- If you have an existing session on `rhino03`, you will still be able to log in until the system is shut
down on February 3. Any running processes, connections, NoMachine sessions, grabnode, or tmux/screen sessions
you may have running will be closed at that time.
- During this maintenance, NoMachine will be upgraded from v8 to v9
