echo "=================================="
echo "   DISK AND PERMISSION AUDITOR"
echo "=================================="
echo ""
echo "Auditing critical system directories..."
echo ""

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/boot")

printf "%-20s | %-20s | %-15s | %-10s\n" "DIRECTORY" "OWNER:GROUP" "PERMISSIONS" "SIZE"
echo "=================================================================="

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')     
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')     
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')     
        
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        printf "%-20s | %-20s | %-15s | %-10s\n" "$DIR" "$OWNER:$GROUP" "$PERMS" "$SIZE"
    else
        printf "%-20s | NOT FOUND on this system\n" "$DIR"
    fi
done

echo ""
echo "=================================="
echo "Python Software Configuration Check"
echo "=================================="
echo ""

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
