#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -1)

if [[ -z "$player" ]]; then
  exit
fi

status=$(playerctl -p "$player" status 2>/dev/null)

if [[ "$status" != "Playing" ]]; then
  exit
fi

pos=$(playerctl -p "$player" position 2>/dev/null | cut -d '.' -f1)
length=$(playerctl -p "$player" metadata mpris:length 2>/dev/null | cut -d '.' -f1)
length=$(( length / 1000000 ))

if [[ -z "$pos" || -z "$length" || "$length" -eq 0 ]]; then
  exit
fi

format_time() {
  local h=$(( $1 / 3600 ))
  local m=$(( ($1 % 3600) / 60 ))
  local s=$(( $1 % 60 ))
  printf "%02d:%02d:%02d" "$h" "$m" "$s"
}

pos_fmt=$(format_time "$pos")
len_fmt=$(format_time "$length")

echo "$pos_fmt / $len_fmt"
