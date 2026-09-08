#!/usr/bin/env bash
if [[ $# -ne 1 ]]; then
echo "Usage: ./scripts/analyze.sh FILE"
exit 1
fi

LOG_FILE="$1"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: File $LOG_FILE does not exist"
    exit 1
fi

total_error=$(grep -c "ERROR" "$LOG_FILE")
top_code=$(awk '{print $5}' "$LOG_FILE" | awk -F '=' '{print $2}' | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')
echo "Total ERROR: $total_error"
echo "Top Code: $top_code"

exit 0
