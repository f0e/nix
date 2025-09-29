#!/usr/bin/env bash

#####
# mutes audio, pauses players & locks screen.
# restores previous state on unlock.
#####

# exit if already locked
pidof hyprlock >/dev/null && exit 0

DEFAULT_SINK="@DEFAULT_AUDIO_SINK@"

STATE_FILE="/tmp/hyprlock-audio-state"
PLAYER_STATE_FILE="/tmp/hyprlock-player-state"

# save whether we're muted
MUTED=$(wpctl get-volume $DEFAULT_SINK | grep -q MUTED && echo 1 || echo 0)
echo "$MUTED" > "$STATE_FILE"

# mute
wpctl set-mute $DEFAULT_SINK 1

# players - save whether we're playing & pause
playerctl -l | while read player; do
    STATUS=$(playerctl -p "$player" status)
    if [ "$STATUS" = "Playing" ]; then
        echo "$player" >> "$PLAYER_STATE_FILE"
        playerctl -p "$player" pause
    fi
done

# ------------------------

hyprlock "$@"

# ------------------------

# restore mute
if [ -f "$STATE_FILE" ]; then
    if [ "$(cat "$STATE_FILE")" -eq 1 ]; then
        wpctl set-mute $DEFAULT_SINK 1
    else
        wpctl set-mute $DEFAULT_SINK 0
    fi
    rm "$STATE_FILE"
fi

# restore players
if [ -f "$PLAYER_STATE_FILE" ]; then
    while read player; do
        playerctl -p "$player" play
    done < "$PLAYER_STATE_FILE"
    rm "$PLAYER_STATE_FILE"
fi
