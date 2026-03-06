sudo systemctl --machine=melody@.host --user restart pipewire wireplumber pipewire-pulse
sudo alsactl restore
sudo systemctl restart linux-voice-assistant
sudo alsactl restore