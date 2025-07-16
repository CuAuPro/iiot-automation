#!/bin/bash

# --- CONFIG ---
PASSWD_FILE="/etc/mosquitto/credentials/passwd"
MQTT_USER="${MQTT_USER:-admin}"
MQTT_PASS="${MQTT_PASS:-changeme}"

# --- Create credentials directory if missing ---
mkdir -p "$(dirname "$PASSWD_FILE")"

# --- Create password file on first start ---
if [ ! -f "$PASSWD_FILE" ]; then
  echo "Generating Mosquitto password file..."
  mosquitto_passwd -b -c "$PASSWD_FILE" "$MQTT_USER" "$MQTT_PASS"
else
  echo "Password file already exists, skipping creation."
fi

# --- Ensure correct permissions ---
chown -R mosquitto:mosquitto /etc/mosquitto/credentials
chown -R mosquitto:mosquitto /etc/mosquitto/certs

# --- Start Mosquitto ---
exec /usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
