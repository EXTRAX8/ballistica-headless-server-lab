# Ballistica (BombSquad) Headless Linux Server Lab

An open-source configuration and automation repository for deploying, benchmarking, and managing headless **Ballistica / BombSquad** game servers on Linux (Ubuntu/Debian).

## Technical Objectives
- **UDP Network Optimization:** Testing low-latency packet routing and port management (`UDP 43210`) under Linux UFW/iptables.
- **Python Plugin Development:** Building custom server-side moderation tools, automated playlist rotators, and player telemetry scripts in Python.
- **Process Persistence:** Implementing resilient background execution using `tmux` and `systemd` services for 24/7 uptime.

## Quick Deployment Stack
- **OS:** Ubuntu 22.04 LTS / Debian 12
- **Runtime:** Python 3.x + Ballistica Headless Server Binary
- **Security:** Strict UFW rules (SSH + UDP Game Port only)

## License
Open-source educational project licensed under MIT.
