---
Title: rhino01 maintenance on January 6
---

As part of the [E2 Data Center Work](/_scicompannounce/2025-12-07-e2-data-center-work) scheduled for
January 6, 2026, `rhino01` will be temporarily offline. In preparation, we have set login restrictions
to limit access to those users with existing sessions.

- `rhino02` and `rhino03` will NOT be impacted by this maintenance
- If you use `ssh rhino` to connect, you will be automatically routed to either `rhino02` or `rhino03`
- If you have an existing session on `rhino01`, you will still be able to log in until the system is shut
down on January 6. Any running processes, connections, NoMachine sessions, grabnode, or tmux/screen sessions
you may have running will be closed at that time.
- As a reminder, `rhino02` will be offline on January 20 followed by `rhino03` on February 3
