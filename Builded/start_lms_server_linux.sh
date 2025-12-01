#!/bin/bash
# LMS Server Start Script for Linux
# Author: AI Assistant
# Date: 2025-11-04

echo "=================================================="
echo "Starting OpenJK LMS Dedicated Server (Linux)..."
echo "=================================================="

# Set paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR="$SCRIPT_DIR/base"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Copy game module
echo "Ensuring game module is in place..."
cp -f "$SCRIPT_DIR/codemp/game/jampgamex86_64.so" "$BASE_DIR/"

# Server Configuration
SERVER_NAME="LMS Server"
MAX_CLIENTS=16
MAP="mp/duel5"
GAMETYPE=0  # 0 = FFA (for LMS)
RCON_PASSWORD="changeme"
ADMIN_PASSWORD="admin123"
LMS_WIN_ROUNDS=3

# Start the server
echo "Starting server on map: $MAP"
echo "Game Type: FFA (LMS Mode)"
echo "Max Clients: $MAX_CLIENTS"
echo ""

"$SCRIPT_DIR/openjkded.x86_64" \
    +set fs_homepath "$SCRIPT_DIR" \
    +set fs_basepath "$SCRIPT_DIR" \
    +set dedicated 2 \
    +set net_port 29070 \
    +set sv_hostname "$SERVER_NAME" \
    +set sv_maxclients $MAX_CLIENTS \
    +set g_gametype $GAMETYPE \
    +set rconpassword "$RCON_PASSWORD" \
    +set g_lmsAdminPass "$ADMIN_PASSWORD" \
    +set g_lmsTeamWinRounds $LMS_WIN_ROUNDS \
    +set g_lmsTimeLimit "5" \
    +set g_log "server.log" \
    +set g_logSync 1 \
    +map $MAP

echo ""
echo "Server stopped."

