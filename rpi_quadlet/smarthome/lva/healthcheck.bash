
timeout 1 bash -c "cat < /dev/null > /dev/tcp/${HOST:-"$(hostname -I | awk '{print $1}')"}/${PORT:-6053}"
