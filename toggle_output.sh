#!/bin/bash

# Define the card identifier
card_identifier= # Put indentifier here (ex: alsa_card.pci-0000_00_1f.3)

# Define the two profiles
profile1= # Headphones (ex: output:analog-stereo+input:analog-stereo)
profile2= # Speakers (ex: output:iec958-stereo+input:analog-stereo)

# Get the current active profile (using the identifier)
current_profile=$(pactl list cards | grep "$card_identifier" -A 100 | grep "Active Profile" | awk '{print $3}')

# Toggle logic (using the identifier)
if [[ "$current_profile" == "$profile1" ]]; then
  pactl set-card-profile "$card_identifier" "$profile2"
  notification_message="Speakers"
elif [[ "$current_profile" == "$profile2" ]]; then
  pactl set-card-profile "$card_identifier" "$profile1"
  notification_message="Headphones"
else  # Handle unexpected state (important!)
  pactl set-card-profile "$card_identifier" "$profile1" # Default to Headphones (or your preferred default)
  notification_message="Headphones" # Consistent default message
  notify-send "Audio Profile" "Defaulting to Headphones" # Or "Defaulting to $profile1" for more info
fi

# Notify the user (with custom title)
notify-send "Audio Output Changed" "Switched to: $notification_message"
