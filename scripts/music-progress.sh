#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -1)

if [[ -z "$player" ]]; then
  echo "[ -------------------- ]"
  exit
fi

status=$(playerctl -p "$player" status 2>/dev/null)

if [[ "$status" != "Playing" ]]; then
  echo "[ -------------------- ]"
  exit
fi

pos=$(playerctl -p "$player" position 2>/dev/null | cut -d '.' -f1)
length=$(playerctl -p "$player" metadata mpris:length 2>/dev/null | cut -d '.' -f1)
length=$(( length / 1000000 ))

if [[ -z "$pos" || -z "$length" || "$length" -eq 0 ]]; then
  echo "[ -------------------- ]"
  exit
fi

bar_length=20
progress=$(( pos * bar_length / length ))

bar=""
for ((i=0; i<bar_length; i++)); do
  if (( i < progress )); then
    bar+="▓"
  else
    bar+="-"
  fi
done

echo "[ $bar ]"
