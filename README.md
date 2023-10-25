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

Once you have bought a new VPS or created a new set of VM's it's time to set them up! 

1.  **On the control machine**:

```
git clone https://github.com/88plug/presearch-node-ansible-playbook
cd presearch-node-ansible-playbook
```

2. **Edit** hosts.ini and update with your IP addresses
```
nano hosts.ini
```

3. **Run** add-key.sh to copy your public key to each server.
```
chmod +x add-key.sh && ./add-key.sh
```

4. **Run** a dry run of the Ansible Playbook against the hosts.ini.
```
ansible-playbook -i hosts.ini playbook.yml -e "PRESEARCH_REGISTRATION_CODE=XXXXX --check
```

5. **Run** the playbook for real and create new Presearch nodes.
```
ansible-playbook -i hosts.ini playbook.yml -e "PRESEARCH_REGISTRATION_CODE=XXXXX
```
6. **[Check Presearch Dashboard](https://nodes.presearch.com/dashboard?rid=4613404)** You should see the new nodes appear after each succesful installation.
7. **Problems?** If you encounter a problem, you can reverse the Playbook.


## Still can't figure it out? : 
### Deploy a Presearch node to a decentralized provider in just a few clicks. Using [Keplr](https://keplr.app) wallet bridge Cosmos (ATOM) to Akash (AKT). Then deploy and scale on [https://deploy.cloudmos.io](https://deploy.cloudmos.io/templates/akash-network-awesome-akash-presearch)

