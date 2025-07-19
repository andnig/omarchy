#!/bin/bash

hyprctl dispatch workspace 5
sleep 0.5
uwsm app -- chromium --user-data-dir='/home/andreas/.config/chromium' --profile-directory='Profile 2' --ozone-platform=wayland --app="https://chatgpt.com" &
sleep 0.2
uwsm app -- chromium --user-data-dir='/home/andreas/.config/chromium' --profile-directory='Profile 2' --ozone-platform=wayland --app="https://claude.com" &
sleep 0.5
hyprctl dispatch workspace previous
