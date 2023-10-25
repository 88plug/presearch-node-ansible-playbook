# Setup a Presearch node on any VPS with Ansible Playbook

## Requirements: 
### - A control machine (Linux for now), this is used to create the hosts.ini file and where you run the Ansible Playbook against the VPS.
### - Presearch Nodes: [VPS](https://my.racknerd.com/aff.php?aff=9475) / 
### - `apt-get install ansible` on the control machine.

## Installation: 

1. **Create a hosts.ini** in the following format. 
```
[presearch-nodes]
#Hosted on the Akash.Network/Racknerd...etc
root@x.x.x.x
root@x.x.x.x
root@x.x.x.x
```

2. **Create add-key.sh** which will add your public key to each VPS.
```
#!/bin/bash

# Extract hosts from hosts.ini under [racknerd] group
hosts=$(awk '/\[presearch-nodes\]/ {flag=1; next} /^$/ {flag=0} flag' hosts.ini)

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
```

3. Run `chmod +x add-key.sh && ./add-key.sh`. Enter the password for each server when prompted.
4. Run `ansible-playbook -i hosts.ini playbook.yml --check` to dry run the Ansible Playbook against the hosts.ini.
5. If there are no errors, remove `--check` and run `ansible-playbook -i hosts.ini playbook.yml`

-
## Skip the line: [Akash.Network](https://deploy.cloudmos.io/templates/akash-network-awesome-akash-presearch)
### Deploy a Presearch node to a decentralized provider in just a few clicks. Using [Keplr](https://keplr.app) wallet bridge Cosmos (ATOM) to Akash (AKT). Then deploy and scale on [https://deploy.cloudmos.io](https://deploy.cloudmos.io)

