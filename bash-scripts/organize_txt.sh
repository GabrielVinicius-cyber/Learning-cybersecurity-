#!/bin/bash

# Exit on error and on use of undefined variables
set -eu

# Log file location
LOGFILE="script.log"

# Function to write informational logs
log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

# Function to write error logs (stderr + file)
log_error() {
    local MSG="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $MSG" | tee -a "$LOGFILE" >&2
}

# Script execution started
log_info "Script started"

# Destination directory for .txt files
DEST="$HOME/lab/docs/arquivos_txt_v3"
mkdir -p "$DEST"

# Check if destination directory exists
if [ -d "$DEST" ]; then
    log_info "Directory exists"
fi

# Check for .txt files and move them
if ls *.txt > /dev/null 2>&1; then
    log_info "TXT files found"
    mv *.txt "$DEST"
    log_info "Files moved successfully"
else
    log_error "No .txt files found"
fi

# Script execution finished
log_info "Process finished"
