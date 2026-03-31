LOGFILE=$1                      
KEYWORD=${2:-"error"}         

echo "=================================="
echo "   LOG FILE ANALYZER"
echo "=================================="
echo ""

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

COUNT=0

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Analysis Results:"
echo "================="
echo "Total lines containing '$KEYWORD': $COUNT"
echo ""

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
