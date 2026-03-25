cd /srv
git clone https://github.com/iddo/pipewire-system
cd pipewire-system

install -Dm644 pipewire.service "/etc/systemd/system/pipewire.service"
install -Dm644 pipewire.socket "/etc/systemd/system/pipewire.socket"
install -Dm644 pipewire-pulse.service "/etc/systemd/system/pipewire-pulse.service"
install -Dm644 pipewire-pulse.socket "/etc/systemd/system/pipewire-pulse.socket"
install -Dm644 wireplumber.service "/etc/systemd/system/wireplumber.service"


install -Dm644 pipewire.sh "/etc/profile.d/pipewire.sh"


install -Dm644 pipewire-tmpfiles.conf "/etc/tmpfiles.d/pipewire.conf"


install -Dm644 org.pipewire.system.conf "/etc/dbus-1/system.d/org.pipewire.system.conf"

#install -Dm644 wireplumber-bluetooth.conf "/etc/wireplumber/wireplumber.conf.d/11-bluetooth.conf"

#install -Dm644 bluetooth-dropin.conf "/etc/systemd/system/bluetooth.service.d/pipewire-system.conf"


install -d "/etc/systemd/user/"
ln -sf /dev/null "/etc/systemd/user/pipewire.service"
ln -sf /dev/null "/etc/systemd/user/pipewire.socket"
ln -sf /dev/null "/etc/systemd/user/pipewire-pulse.service"
ln -sf /dev/null "/etc/systemd/user/pipewire-pulse.socket"
ln -sf /dev/null "/etc/systemd/user/wireplumber.service"

systemctl enable --now pipewire.service pipewire.socket pipewire-pulse.service pipewire-pulse.socket wireplumber.service