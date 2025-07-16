#!/bin/bash
set -e

log() {
  echo "[INIT] $1"
}

make_dir() {
  local DIR="$1"
  if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    log "Created: $DIR"
  else
    log "Exists:  $DIR"
  fi
}

copy_if_missing() {
  local SRC="$1"
  local DEST="$2"
  if [ ! -f "$DEST" ]; then
    cp "$SRC" "$DEST"
    log "Copied default: $(basename "$DEST")"
  else
    log "Exists:         $DEST"
  fi
}

log "🔧 Initializing volumes for all services..."

# --- MQTT (Mosquitto) ---
make_dir "./mqtt/volume/certs"
make_dir "./mqtt/volume/credentials"
make_dir "./mqtt/volume/config"

copy_if_missing "./mqtt/config/acl.conf.default" "./mqtt/volume/config/acl.conf"
copy_if_missing "./mqtt/config/mosquitto.conf.default" "./mqtt/volume/config/mosquitto.conf"

# --- FUXA ---
make_dir "./fuxa/volume/appdata"
make_dir "./fuxa/volume/db"
make_dir "./fuxa/volume/logs"
make_dir "./fuxa/volume/images"

# --- Node-RED ---
make_dir "./node-red/volume/data"
make_dir "./node-red/volume/flows"
make_dir "./node-red/volume/certs"
make_dir "./node-red/volume/custom-nodes"
make_dir "./node-red/volume/custom-icons"

copy_if_missing "./node-red/settings.js.default" "./node-red/volume/settings.js"
copy_if_missing "./node-red/flows.json.default" "./node-red/volume/flows/flows.json"


copy_if_missing ".env.default" ".env"

log "✅ All folders and default configs initialized."
