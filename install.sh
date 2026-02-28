git pull
sleep 1
podman quadlet install -r quadlet/
sleep 1
systemctl restart smarthome-pod.service
