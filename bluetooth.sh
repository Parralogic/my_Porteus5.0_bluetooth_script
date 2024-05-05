#!/bin/bash
#Creator: David Parra-Sandoval
#Date: 04/30/2024
#Last Modified: 05/01/2024
clear

OSLINUX=$(cat /etc/os-release | grep PRETTY_NAME | cut -d "=" -f 2 | cut -d '"' -f 2)
if [[ $OSLINUX = "Porteus 5.0" ]]; then
echo "Yes your running the right Linux OS!"
sleep 3
else exit 1
fi

if [[ $UID != 0 ]]; then
echo Please run Script with root/sudo privileges!
exit 1
fi

DRIVE=$(sudo blkid | grep 79579c34-d06b-44f3-8dc0-26112836ccc6 | cut -d ":" -f 1 | cut -d "/" -f 3)

echo -e "\e[34mThe Fucking process I took to enable Bluetooth in Porteus5.0!\e[00m"
echo -e "\e[34mFirst I copied the firmware files to the \e[32m[/lib/firmware/intel]\e[34min my\e[32m[/mnt/$DRIVE/Porteus5.0_Linux/btintelFirmware/]\e[34m directory.\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
echo "cp -v /mnt/sdb2/Porteus5.0_Linux/btintelFirmware/* /lib/firmware/intel/"
cp -v /mnt/$DRIVE/Porteus5.0_Linux/btintelFirmware/* /lib/firmware/intel/
echo
read -p "PRESS Enter to Continue"

echo -e "\e[34mThen; I Dont Play That Shit!, so I made everything in the \e[32m/lib/firmware/intel/\e[34m executable.\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
echo -e "chmod -v 777 /lib/firmware/intel/*"
chmod -v 777 /lib/firmware/intel/*
echo
read -p "PRESS Enter to Continue"

echo -e "\e[34mThen the fucking rc file in the \e[32m[/etc/rc.d/rc.bluetooth]\e[34m was NOT executable; it had to be executable to run the bitch.."
echo -e "so it can launch the \e[36mdaemon=bluetoothd\e[34m and other shit like: sdptool, hciconfig, hciattach..."
echo -e "So, since I Dont Play That Shit!; I too also made all the files there executable.\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
echo -e "chmod -v 777 /etc/rc.d/*"
sleep 20
chmod -v 777 /etc/rc.d/*
echo
read -p "PRESS Enter to Continue"

echo -e "\e[34mNow the fun part, I created two loops to monitor what's occurring, first I bring up dmesg in a loop...\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
echo "while true; do dmesg; sleep 6 ;done"

DMESG () {
cat << EOF
while true; do
dmesg
sleep 6
done
EOF
}
#export -f DMESG
DMESG > DMESG && chmod +x DMESG
echo "In the terminal input ./DMESG Dont Close the Terminal!"
exec konsole &
read -p "PRESS Enter to Continue"
echo
echo
echo -e "\e[34mThen a loop for rfkill to also monitor if the bluetooth device still there, after I launch the \e[36mdaemon...\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
echo "while true; do rfkill; sleep 2; done"

RFKILL () {
cat << EOF
while true; do
sudo rfkill
sleep 2
done
EOF
}
#export -f RFKILL
RFKILL > RFKILL && chmod +x RFKILL
echo "In the terminal input ./RFKILL Dont Close the Terminal!"
exec konsole &
read -p "PRESS Enter to Continue"
echo
echo -e "\e[34mNow I made sure all the fucking kernel module/s where present and the vast research, with many tools; like:\e[00m"
cat << EOF
usb_modeswitch
systool
bluetoothctl
hciconfig
lsmod
modprobe
modinfo
rmmod
btmon
EOF
echo -e "\e[32mhttps://askubuntu.com/questions/1235757/ubuntu-20-04-rtl8723-bluetooth-not-working\e[00m"
echo -e "\e[34mThis link helped me out in knowing what modules needed to be present."
echo -e "when I checked, btqca was not present running modprobe: FATAL: Module btqca not found in directory \e[32m/lib/modules/5.18.8-porteus\e[00m"
echo
echo
echo -e "\e[34mBut first I also made sure two more fucking tools where running btmon and bluetoothctl.\e[00m"
echo
echo "In the terminal input btmon Dont Close the Terminal!"
exec konsole &
read -p "PRESS Enter to Continue"
echo
echo
echo "In the terminal input bluetoothctl Dont Close the Terminal!"
echo -e "\e[34mbluetoothctl because it waits till the \e[96mdaemon=bluetoothd\e[34m is running; then it will launch into its prompt.\e[00m"
exec konsole &
read -p "PRESS Enter to Continue"
echo
echo
echo -e "\e[34mNow I did a for loop to load the module/s; check the dmesg terminal.\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
cat << EOF
for i in btrtl btqca btintel hci_uart bnep hidp btbcm rfcomm; do
sudo modprobe -v si
done
EOF
for i in btrtl btqca btintel hci_uart bnep hidp btbcm rfcomm; do
sudo modprobe -v $i
sleep 2
done
read -p "PRESS Enter to Continue"
echo
echo
echo -e "\e[34mThen it was the TIME to fucking launch/run/execute the bitch HAHAHAHAHAhahaha!\e[00m"
echo -e "\e[94mLike so...\e[00m"
echo
echo "/etc/rc.d/rc.bluetooth start"
read -p "PRESS Enter:Look at the terminals, see what they do!"
echo               ##Yes; I know HAHAHahahahaha
echo               ##Yes; I know HAHAHAhahahaha Im actually writing this script and for got to execute!
echo -e "\e[34mThen Nothing sorta happened, so I ran/executed hciconfig hci0\e[00m"
echo
echo -e "\e[94mLike so...\e[00m"
echo -e "hciconfig hci0"
hciconfig hci0
echo
echo -e "\e[34mThat Mother-Fucker! was DOWN!!\e[00m"
read -p "PRESS Enter to Continue"
echo
echo -e "\e[34mSo I brought that bitch UP!\e[00m"
echo
echo -e "\e[34mLike so...\e[00m"
echo -e "hciconfig hci0 up"
hciconfig hci0 up && hciconfig hci0
echo
read -p "PRESS Enter to Continue"
echo
echo
echo -e "\e[34mThen I re-executed the fucking EXECUTABLE rc file again \e[32m/etc/rc.d/rc.bluetooth"
echo -e "\e[34mBut first I stoped it \e[32m/etc/rc.d/rc.bluetooth stop\e[00m" ##Yes; I did not put the command IM doing both.!!!
echo
/etc/rc.d/rc.bluetooth stop
echo
echo -e "\e[34mKeep your eyes on the TERMINALS\e[00m"
read -p "PRESS Enter to Now Actually execute /etc/rc.d/rc.bluetooth start"
/etc/rc.d/rc.bluetooth start
echo
echo -e "\e[34mThen I ran/executed rmmod -v btusb, because that mother-fucker Not working!\e[00m"
echo
echo -e "\e[94mLike so...\e[00m"
echo -e "rmmod -v btusb"
rmmod -v btusb
read -p "PRESS Enter to Continue: BUT check the TERMINALS!"
echo
echo
echo -e "\e[34mThen I re-loaded the module with modprobe.\e[00m"
echo
echo -e "\e[94mLike so...\e[00m"
echo -e "modprobe -v btusb"
modprobe -v btusb
echo
echo -e "\e[96mThat MOTHER-FUCKER working NOW!!!, The Kernel is like WTF!!\e[00m"
