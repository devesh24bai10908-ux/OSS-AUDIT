#!/bin/bash
# Script 4: Log File Analyzer
# Author: Shubham Mishra | Registration: 24BCY10064
# Purpose: Read log files and count lines containing specific keywords
# Concepts: while-read loop, if-then conditional, counter variables, command-line arguments

# --- Accept log file path and keyword from command line ---
LOGFILE=$1                      # First argument: path to log file
KEYWORD=${2:-"error"}          # Second argument: keyword to search (default: "error")

echo "=================================="
echo "   LOG FILE ANALYZER"
echo "=================================="
echo ""

# --- Validate that a log file path was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo ""
    echo "Examples:"
    echo "  $0 /var/log/syslog"
    echo "  $0 /var/log/syslog error"
    echo "  $0 /var/log/syslog WARNING"
    echo ""
    echo "Note: Default keyword is 'error' if not specified"
    exit 1
fi

# --- Check if the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found."
    echo ""
    echo "Some common log file locations:"
    echo "  /var/log/syslog"
    echo "  /var/log/messages"
    echo "  /var/log/auth.log"
    echo "  /var/log/daemon.log"
    exit 1
fi

echo "Log File       : $LOGFILE"
echo "Search Keyword : $KEYWORD (case-insensitive)"
echo ""
echo "Analyzing log file..."
echo ""

# --- Initialize counter for matching lines ---
COUNT=0

# --- Read log file line by line ---
while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive search)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment counter when keyword is found
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Display analysis results ---
echo "Analysis Results:"
echo "================="
echo "Total lines containing '$KEYWORD': $COUNT"
echo ""

# --- Show last 5 matching lines for context ---
echo "Last 5 matching lines:"
echo "======================"
grep -in "$KEYWORD" "$LOGFILE" 2>/dev/null | tail -5

if [ $? -ne 0 ]; then
    echo "No matching lines found in the log file."
fi

echo ""
echo "=================================="
echo "Analysis Complete"
echo "=================================="
