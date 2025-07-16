#!/bin/bash
set -e

log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

SCRIPTS_DIR="/usr/scripts"

CUSTOM_NODES_DIR="/usr/custom-nodes"

INSTALL_SCRIPT="${SCRIPTS_DIR}/install_custom_nodes.sh"

# Reinstall flag
REINSTALL=${FORCE_REINSTALL:-false}

log "Initializing Node-RED setup..."

# Install custom nodes if missing or forced
if [ "$REINSTALL" = "true" ] || [ ! -d "$CUSTOM_NODES_DIR" ]; then
    log "Installing custom nodes (force=$REINSTALL)..."

    if [ -x "$INSTALL_SCRIPT" ]; then
        log "Running install script for custom nodes..."
        "$INSTALL_SCRIPT" /data
    else
        log "No install script found or not executable."
    fi
else
    log "Custom nodes already present. Skipping installation."
fi

# Start Node-RED
log "Starting Node-RED..."
exec npm start --cache /data/.npm -- --userDir /data --settings /usr/settings.js
