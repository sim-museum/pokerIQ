#!/bin/bash
# Launch Poker IQ trainer
cd "$(dirname "$0")"
SCRIPT_DIR="$PWD"
MON_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ ! -d venv ]]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    source venv/bin/activate
    pip install -q -r requirements.txt
else
    source venv/bin/activate
fi

# Remove log files from previous sessions
rm -f "$SCRIPT_DIR"/poker_log_*.txt

snapshot_time=$(date +%s)
[[ -n "${SGL_GAME_STARTED_MARKER:-}" ]] && touch "$SGL_GAME_STARTED_MARKER"
python3 pokerIQ.py "$@"

# Optional: annotate this session's logs with Claude when the annotation helper is installed beside pokerIQ
[[ -f "$MON_DIR/claude_annotate_poker.sh" ]] || exit 0
source "$MON_DIR/claude_annotate_poker.sh"
while IFS= read -r -d '' log_file; do
    fmod=$(stat -c %Y "$log_file" 2>/dev/null) || continue
    if [[ "$fmod" -gt "$snapshot_time" ]]; then
        claude_annotate_poker "$log_file"
    fi
done < <(find "$SCRIPT_DIR" -maxdepth 1 -name "poker_log_*.txt" -type f -print0 2>/dev/null)
