#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Shubham Mishra | Registration: 24BCY10064
# Purpose: Audit system directories for disk usage and permission details
# Concepts: for loop, df, ls -ld, awk, cut, conditional logic

echo "=================================="
echo "   DISK AND PERMISSION AUDITOR"
echo "=================================="
echo ""
echo "Auditing critical system directories..."
echo ""

# --- Array of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/boot")

# --- Print header for the audit report ---
printf "%-20s | %-20s | %-15s | %-10s\n" "DIRECTORY" "OWNER:GROUP" "PERMISSIONS" "SIZE"
echo "=================================================================="

# --- Loop through each directory and collect audit information ---
for DIR in "${DIRS[@]}"; do
    # Check if directory exists on the system
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')      # Get permission bits (rwxrwxrwx)
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')      # Get owner name
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')      # Get group name
        
        # Get disk usage in human-readable format
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # Print formatted audit line
        printf "%-20s | %-20s | %-15s | %-10s\n" "$DIR" "$OWNER:$GROUP" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "%-20s | NOT FOUND on this system\n" "$DIR"
    fi
done

echo ""
echo "=================================="
echo "Python Software Configuration Check"
echo "=================================="
echo ""

# --- Check for Python configuration and installation directories ---
PYTHON_DIRS=("/usr/lib/python3" "/etc/python" "/usr/local/lib/python3")

echo "Searching for Python-related directories..."
echo ""

for PYDIR in "${PYTHON_DIRS[@]}"; do
    if [ -d "$PYDIR" ]; then
        echo "✓ Found: $PYDIR"
        PERMS=$(ls -ld "$PYDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$PYDIR" 2>/dev/null | cut -f1)
        echo "  Permissions: $PERMS"
        echo "  Size: $SIZE"
        echo ""
    fi
done

# --- Check if Python is installed and accessible ---
if command -v python3 &> /dev/null; then
    PYTHON_PATH=$(which python3)
    echo "✓ Python executable found at: $PYTHON_PATH"
    PYTHON_PERMS=$(ls -l "$PYTHON_PATH" | awk '{print $1, $3, $4}')
    echo "  Permissions: $PYTHON_PERMS"
    echo ""
fi

echo "=================================="
echo "Audit Complete"
echo "=================================="
