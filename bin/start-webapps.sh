#!/bin/bash

hyprctl dispatch workspace 5

chromium --user-data-dir='/home/andreas/.config/chromium' --profile-directory='Profile 2' --ozone-platform=wayland --app="https://chatgpt.com"
chromium --user-data-dir='/home/andreas/.config/chromium' --profile-directory='Profile 2' --ozone-platform=wayland --app="https://claude.com"

sleep 0.2

hyprctl dispatch workspace previous
