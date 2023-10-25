# Setup a [Presearch](https://presearch.com/signup?rid=4613404) node on any VPS with this Ansible playbook
[![image](https://github.com/88plug/presearch-node-ansible-playbook/assets/19512127/1ff18269-7e08-4135-ad1d-858df85c171f)
](https://presearch.com/signup?rid=4613404) 

# Prerequisites for Setup:

1. **Control Machine**: 
   - Must be Linux-based.
   - Used to generate the `hosts.ini` file.
   - This is where you'll run the Ansible Playbook targeting the VPS.
   - Ensure Ansible is set up on the control machine:
     ```bash
     apt-get install ansible
     ```

2. **VPS/VM Minimum Requirements**:
   - 1 CPU | 1GB Memory | 10GB SSD/NVMe Disk
   - Debian 9/10 or Ubuntu Server 18.04/20.04

3. **IP Configuration**:
   - Currently supports a single IPv4 address only per VPS.

### **VPS Provider Recommendations:**
[HostHatch](https://cloud.hosthatch.com/a/1577) |
[Racknerd](https://my.racknerd.com/aff.php?aff=9475) |
[Vultr](https://www.vultr.com/?ref=7703094) |
[DigitalOcean](https://m.do.co/c/d9874e8ceba7)


## Installation:

1. **Create a hosts.ini** in the following format. 
```
[presearch-nodes]
#New VPS/VM for Presearch
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
## : [Akash.Network](https://deploy.cloudmos.io/templates/akash-network-awesome-akash-presearch)
### Deploy a Presearch node to a decentralized provider in just a few clicks. Using [Keplr](https://keplr.app) wallet bridge Cosmos (ATOM) to Akash (AKT). Then deploy and scale on [https://deploy.cloudmos.io](https://deploy.cloudmos.io)

