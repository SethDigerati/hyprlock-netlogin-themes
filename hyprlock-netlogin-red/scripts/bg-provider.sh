#!/bin/bash
BG_DIR="$(cd "$(dirname "$0")/../backgrounds" && pwd)"
CACHE="$HOME/.cache/hyprlock-bg-idx"
mapfile -t FILES < <(ls "$BG_DIR"/{*.jpg,*.jpeg,*.png,*.bmp} 2>/dev/null | sort)
IDX=$(cat "$CACHE" 2>/dev/null || echo 0)
echo "${FILES[$IDX]}"
