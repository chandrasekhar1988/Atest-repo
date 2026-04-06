#!/bin/bash

# 1. Path to the folder containing old log files
LOG_DIR="/tmp/shellscript-logs"

# 2. Number of days old a file must be to be deleted
DAYS_OLD=7

echo "--- Log cleanup started at $(date) ---"

# 3. Check if the specified directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist!"
    exit 1
fi

# 4. Find and delete the old log files
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec rm -f {} \;

echo "Log files older than 7 days have been successfully deleted."
echo "--- Cleanup completed ---"