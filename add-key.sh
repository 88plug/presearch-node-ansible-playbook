#!/bin/bash

# Extract hosts from hosts.ini under [racknerd] group
hosts=$(awk '/\[presearch_nodes\]/ {flag=1; next} /^$/ {flag=0} flag' hosts.ini)

IFS=$'\n'       # Set Internal Field Separator to newline for the loop
for host in $hosts; do
    # Skip if line starts with a comment
    [[ $host =~ ^#.* ]] && continue

    # Extract the hostname/IP without the user for feedback
    hostname=$(echo "$host" | cut -d'@' -f2)

    echo "==> Copying SSH key to $hostname. Please enter password when prompted."
    
    # Try to copy the key. Using -o StrictHostKeyChecking=no to automatically accept the host key.
    if ! ssh-copy-id -o StrictHostKeyChecking=no "$host"; then
        ssh-keygen -R "$hostname"  # Remove problematic key entry
        echo "==> Retrying..."
        ssh-copy-id -o StrictHostKeyChecking=no "$host" || echo "Failed for $hostname. Skipping."
    fi
done

echo "Process completed."
