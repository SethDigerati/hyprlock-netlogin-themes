#!/bin/bash
BG_DIR="$(cd "$(dirname "$0")/../backgrounds" && pwd)"
CACHE="$HOME/.cache/hyprlock-bg-idx"
mapfile -t FILES < <(ls "$BG_DIR"/{*.jpg,*.jpeg,*.png,*.bmp} 2>/dev/null | sort)
COUNT=${#FILES[@]}
[ "$COUNT" -le 1 ] && exit 0
IDX=$(cat "$CACHE" 2>/dev/null || echo 0)
NEXT=$(( (IDX + 1) % COUNT ))
echo "$NEXT" > "$CACHE"
pkill -USR2 hyprlock
