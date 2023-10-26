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
   - Used to edit the `hosts.ini` file.
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

![image](https://github.com/88plug/presearch-node-ansible-playbook/assets/19512127/62f94bc8-28fa-4c44-b280-161c52afbbc2)

7. **Click** Stake button next to each node to add at least 4,000 PRE and update the description with a user-friendly name.
8. **Click** Stats button next to each node to see IP address and other information.

---

## Succesful output example:
```
PLAY [all] ***************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Ensure the system timezone is set to UTC] **************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Update and upgrade all packages] ***********************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Upgrade all packages non-interactively and install additional tools] ***********************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Install UFW] *******************************************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Set UFW default incoming policy to deny] ***************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Set UFW default outgoing policy to allow] **************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Allow SSH through UFW] *********************************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Enable UFW] ********************************************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Install fail2ban] **************************************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Configure fail2ban for permanent jailing] **************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Ensure fail2ban service is enabled and running] ********************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Set GRUB timeout] **************************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Ensure chrony (NTP) package is installed] **************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Ensure chrony service is enabled and running] **********************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Force an immediate synchronization of the time] ********************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Check if NTP is synchronized] **************************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161]

TASK [Display NTP synchronization status] ********************************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161] => {
    "ntp_status.stdout_lines": [
        "Reference ID    : 00000000 ()",
        "Stratum         : 0",
        "Ref time (UTC)  : Thu Jan 01 00:00:00 1970",
        "System time     : 0.000000000 seconds fast of NTP time",
        "Last offset     : +0.000000000 seconds",
        "RMS offset      : 0.000000000 seconds",
        "Frequency       : 65.433 ppm slow",
        "Residual freq   : +0.000 ppm",
        "Skew            : 0.000 ppm",
        "Root delay      : 1.000000000 seconds",
        "Root dispersion : 1.000000000 seconds",
        "Update interval : 0.0 seconds",
        "Leap status     : Not synchronised"
    ]
}

TASK [Increase max FD limit / ulimit] ************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Add sysctl.conf parameters] ****************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161] => (item={'name': 'vm.min_free_kbytes', 'value': '131072'})
changed: [root@45.32.129.161] => (item={'name': 'vm.swappiness', 'value': '0'})
changed: [root@45.32.129.161] => (item={'name': 'fs.inotify.max_queued_events', 'value': '1048576'})
changed: [root@45.32.129.161] => (item={'name': 'fs.inotify.max_user_instances', 'value': '1048576'})
changed: [root@45.32.129.161] => (item={'name': 'fs.inotify.max_user_watches', 'value': '1048576'})
changed: [root@45.32.129.161] => (item={'name': 'vm.max_map_count', 'value': '262144'})
changed: [root@45.32.129.161] => (item={'name': 'fs.aio-max-nr', 'value': '524288'})

TASK [Clear all journald logs] *******************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Mask and stop systemd-journald] ************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Configure Docker to not store logs] ********************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Run BleachBit] *****************************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Restart server] ****************************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Stop and remove existing Presearch containers] *********************************************************************************************************************************************************************************************************
ok: [root@45.32.129.161] => (item=presearch-node)
ok: [root@45.32.129.161] => (item=presearch-auto-updater)

TASK [Start Watchtower container] ****************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

TASK [Start Presearch Node container] ************************************************************************************************************************************************************************************************************************
changed: [root@45.32.129.161]

PLAY RECAP ***************************************************************************************************************************************************************************************************************************************************
root@45.32.129.161         : ok=28   changed=14   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Tags in the Playbook

### In the Ansible playbook, various tasks are organized with tags. Using these tags, you can run specific sections of the playbook. Below is a description of each tag:

    timezone:
        Ensures the system timezone is set to UTC.

    apt:
        Tasks related to the APT package manager.
        Updates and upgrades all system packages.
        Installs additional tools such as htop, bmon, jq, etc.

    ufw:
        Firewall configurations using UFW (Uncomplicated Firewall).
        Sets default policies, allows SSH, and ensures the firewall is enabled.

    fail2ban:
        Installs and configures fail2ban for security.
        Configures fail2ban for permanent jailing of IP addresses that fail authentication.

    grub-timeout:
        Sets the GRUB bootloader timeout to 0 seconds for faster booting.

    ntp:
        Ensures the chrony (NTP) package is installed for time synchronization.
        Forces immediate time synchronization and displays the NTP status.

    tune-filesystem-limits:
        Increases the system's file descriptor limits for better performance.

    tune-kernel-limits:
        Adjusts various kernel parameters using sysctl for optimized performance.

    clear-journald-logs:
        Clears all systemd journald logs.

    disable-systemd-journald:
        Masks and stops the systemd-journald service.

    disable-docker-logs:
        Configures Docker to not store logs.

    bleachbit:
        Runs the BleachBit system cleaning tool.

    reboot:
        Reboots the server to apply system changes.

    presearch:
        Manages Docker containers related to Presearch, including stopping/removing and starting them.

To run specific sections of the playbook, use the --tags option with the ansible-playbook command. For example, to only run the timezone tasks:

## Run tags like reboot for example.

```
ansible-playbook -i hosts.ini playbook.yml -e "PRESEARCH_REGISTRATION_CODE=XXXXX" --tags reboot
```
