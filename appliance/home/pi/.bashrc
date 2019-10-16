echo ""
echo "Welcome to Blinkenlights."
read -p "Set unique hostname: " HOSTNAME
read -p "Set username for admin: " USERNAME
read -p "Enter password: " -s PASSWORD

echo ""

# Set hostname
echo "$HOSTNAME" | sudo tee /etc/hostname > /dev/null
sudo useradd -p $(openssl passwd -1 $PASSWORD) -G sudo,ssh -m -s /bin/bash $USERNAME

echo "Default user will be deleted after reboot. Please log in as $USERNAME"

sudo touch /boot/pi-delete.waiting
sudo systemctl start delete-pi.service
sudo reboot

exit 0