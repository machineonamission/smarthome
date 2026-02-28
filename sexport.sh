#!/bin/bash

# Configuration: Mapping of "old_volume_name" to "new_path"
# Format: "old_name:service_name:sub_folder"
declare -a MAPPINGS=(
    "systemd-matter-server-data:matter-server:data"
    "systemd-haconfig:homeassistant:config"
    "systemd-hamedia:homeassistant:media"
    "systemd-lva-configuration:lva:config"
    "systemd-wakeword_data:lva:wakeword"
    "systemd-ollama-data:ollama:data"
    "systemd-huggingface-hub:speaches:huggingface"
    "adguardconfdir:adguard:conf"
    "adguardworkdir:adguard:work"
)

BASE_DIR="/srv/containers"
QUADLET_DIR="/home/melody/smarthome/neovolumes"

echo "Starting migration to $BASE_DIR..."

for entry in "${MAPPINGS[@]}"; do
    IFS=":" read -r old_name service sub_folder <<< "$entry"
    target_path="$BASE_DIR/$service/$sub_folder"

    echo "Exporting $old_name to $target_path..."
    mkdir -p "$target_path"

    # Export and extract in background
    (
        podman volume export "$old_name" | tar -x -C "$target_path"
        echo "Finished migrating $old_name"
    ) &
done

# Wait for all background exports to finish
wait
echo "All volumes exported successfully."

# Generate Quadlet .volume files
echo "Creating .volume files..."
for entry in "${MAPPINGS[@]}"; do
    IFS=":" read -r old_name service sub_folder <<< "$entry"

    # Determine the name for the .volume file based on the prefix logic
    # If it starts with systemd-, name it based on the service, otherwise use the key
    if [[ $old_name == systemd-* ]]; then
        vol_file="$service.volume"
    else
        vol_file="$service-$sub_folder.volume"
    fi

    cat <<EOF > "$QUADLET_DIR/$vol_file"
[Volume]
Type=none
Device=$BASE_DIR/$service/$sub_folder
EOF
    echo "Created $QUADLET_DIR/$vol_file"
done

systemctl daemon-reload
echo "Done! Run 'systemctl daemon-reload' and check your volumes."
