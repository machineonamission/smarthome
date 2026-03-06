git pull
#sleep 1
#systemctl stop smarthome-pod.service
sudo -u melody cp -r ./pipewire /home/melody/.config/pipewire/pipewire.conf.d/
find ./quadlet -type f -exec cp {} /etc/containers/systemd/ \;
sleep 2
systemctl daemon-reload
#systemctl restart smarthome-pod.service
