#!/usr/bin/env bash
# ==============================================================================
# Ballistica (BombSquad) Headless Server - UFW Firewall Hardening Script
# Purpose: Configures minimal ingress rules (SSH + UDP Game Port 43210)
# Compatibility: Ubuntu 20.04/22.04/24.04 & Debian 11/12
# ==============================================================================

set -euo pipefail

GAME_PORT=43210
SSH_PORT=22

# Ensure script runs with root privileges
if [[ "${EUID}" -ne 0 ]]; then
  echo "[!] Error: Please run this script as root or with sudo."
  exit 1
fi

# Install UFW automatically if missing on minimal VPS images
if ! command -v ufw >/dev/null 2>&1; then
  echo "[*] UFW not found. Installing ufw..."
  apt-get update -qq && apt-get install -y -qq ufw
fi

echo "[*] Configuring default firewall policies..."
ufw --force reset >/dev/null
ufw default deny incoming
ufw default allow outgoing

echo "[*] Opening SSH (TCP/${SSH_PORT}) and Ballistica Port (UDP/${GAME_PORT})..."
ufw allow "${SSH_PORT}/tcp" comment 'Allow SSH Administration'
ufw allow "${GAME_PORT}/udp" comment 'Allow BombSquad UDP Server Traffic'

echo "[*] Activating UFW firewall..."
ufw --force enable

echo "[+] Firewall configuration complete. Active rules:"
ufw status verbose
