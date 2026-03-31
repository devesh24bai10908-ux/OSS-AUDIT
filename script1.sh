#!/bin/bash
# Script 1: System Identity Report
# Author: Shubham Mishra | Registration: 24BCY10064
# Purpose: Display system information as a welcome screen
# Concepts: variables, echo, command substitution, output formatting

# --- Variables ---
STUDENT_NAME="Shubham Mishra"
REG_NUMBER="24BCY10064"
SOFTWARE_CHOICE="Python"  # Change this to your chosen software

# --- System information using command substitution ---
KERNEL=$(uname -r)                          # Get kernel version
DISTRO=$(cat /etc/os-release | grep "^NAME" | cut -d'"' -f2)  # Get distribution name
USER_NAME=$(whoami)                         # Get current user
HOME_DIR=$(echo $HOME)                      # Get home directory path
UPTIME=$(uptime -p)                         # Get system uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')       # Get formatted date
CURRENT_TIME=$(date '+%H:%M:%S')           # Get formatted time

# --- Display welcome screen with formatting ---
echo "=================================="
echo "   OPEN SOURCE AUDIT PROJECT"
echo "=================================="
echo ""
echo "Student Information:"
echo "  Name     : $STUDENT_NAME"
echo "  Reg No   : $REG_NUMBER"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "System Information:"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo ""
echo "Current Status:"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "Open Source License:"
echo "  This Linux system runs on GPL v2 and compliant licenses"
echo "=================================="
