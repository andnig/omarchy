yay -S --noconfirm --needed \
  signal-desktop spotify zoom \
  libreoffice obs-studio kdenlive \
  pinta xournalpp

# Copy over Omarchy applications
source ~/.local/share/omarchy/bin/omarchy-sync-applications || true
