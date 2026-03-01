git pull
sleep 1
systemctl stop smarthome-pod.service
sleep 1
find ./quadlet -type f -exec podman quadlet install --reload-systemd -r {} +
sleep 1
systemctl daemon-reload
systemctl restart smarthome-pod.service
