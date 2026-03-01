git pull
#sleep 1
#systemctl stop smarthome-pod.service
sleep 1
find ./quadlet -type f -exec cp {} /etc/containers/systemd/ \;
sleep 1
systemctl daemon-reload
#systemctl restart smarthome-pod.service
