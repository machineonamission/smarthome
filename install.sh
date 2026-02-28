git pull
sleep 1
find ./quadlet -type f -exec podman quadlet install -r {} +
sleep 1
systemctl restart smarthome-pod.service
