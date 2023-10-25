# Setup a [Presearch](https://presearch.com/signup?rid=4613404) node on any VPS with this Ansible playbook
[![image](https://github.com/88plug/presearch-node-ansible-playbook/assets/19512127/1ff18269-7e08-4135-ad1d-858df85c171f)
](https://presearch.com/signup?rid=4613404) 

# Requirements for Setup:


1. **[MetaMask](https://metamask.io/)**:
   - Install Metamask
   - Click 'Import tokens' in the wallet
   - On the top header click "Custom token"
   - Paste the Presearch (PRE) Contract Address : `0xEC213F83defB583af3A000B1c0ada660b1902A0F`
   - Click "Next" and then "Import"
   - Swap your Ethereum, USDT, or WETH for at least 4,000 PRE
   - Each additional node requires at least 4,000 PRE

2. **[Presearch Account](https://presearch.com/signup?rid=4613404)**: 
   - Signup and get familiar with the interface.
   - You must now deposit at least 4,000 PRE from Metamask to your [Presearch deposit address](https://keywords.presearch.com/transfer-tokens/blockchain?rid=4613404).
   - Once the PRE has arrived to your account it will be visible in you [account wallet](https://account.presearch.com/tokens/pre-wallet?rid=4613404).

3. **Control Machine**: 
   - Must be Linux-based.
   - Used to generate the `hosts.ini` file.
   - This is where you'll run the Ansible Playbook targeting the VPS.
   - Ensure Ansible is set up on the control machine:
     ```bash
     apt-get install ansible
     ```

4. **VPS/VM Minimum Requirements**:
   - 1 CPU | 1GB Memory | 10GB SSD/NVMe Disk
   - Debian 9/10 or Ubuntu Server 18.04/20.04
   - [HostHatch](https://cloud.hosthatch.com/a/1577) |
[Racknerd](https://my.racknerd.com/aff.php?aff=9475) |
[Vultr](https://www.vultr.com/?ref=7703094) |
[DigitalOcean](https://m.do.co/c/d9874e8ceba7)

5. **IP Configuration**:
   - Currently the Ansible playbook only supports a single IPv4 address only per VPS.



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

4. **Run the playbook for real and create new Presearch nodes.** Change XXXXX to your registration code from [dashboard](https://nodes.presearch.com/dashboard?rid=4613404).

![image](https://github.com/88plug/presearch-node-ansible-playbook/assets/19512127/63b853a7-aa42-4347-96cb-fb26ac299aae)
```
ansible-playbook -i hosts.ini playbook.yml -e "PRESEARCH_REGISTRATION_CODE=XXXXX"
```

5. **[Check Presearch Dashboard](https://nodes.presearch.com/dashboard?rid=4613404)** You should see the new nodes appear after each succesful installation.

6. **Click** Stake button next to each node to add at least 4,000 PRE and update the description with a user-friendly name.
7. **Click** Stats button next to each node to see IP address and other information.

