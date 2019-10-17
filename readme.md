# BlinkenLights 

Raspbian imgage overlay for auto-config home automation remote node.

Provides (mDNS discoverable) network access to
* USB devices (_usb._tcp)
* GPIO (_gpio._tcp)
* FadeCandy (_opc._tcp)

Used in 
* Neptr (Never-Ending Pie-Throwing Robot)


## Usage

1. Burn Raspbian Lite image to SD card
2. Run script `build-boot.sh`
3. Install card in Raspberry Pi with open internet access connected via ethernet
4. Pi will run install script and reboot twice, once done `ssh pi:raspberry@raspberrypi.local` and follow setup prompts
