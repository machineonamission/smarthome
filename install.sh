git pull
#sleep 1
#systemctl stop smarthome-pod.service
sudo -u melody cp -r ./pipewire /home/melody/.config/pipewire/pipewire.conf.d/
sudo find ./quadlet -type f -exec cp {} /etc/containers/systemd/ \;
sleep 2
sudo systemctl daemon-reload
#systemctl restart smarthome-pod.service
