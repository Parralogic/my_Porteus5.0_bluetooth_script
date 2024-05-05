This script was written in Porteus5.0 can also be used in Porteus5.01; its the
same shit!, for some reason Porteus5.01 has some ice shit in the firmware intel
directory [/lib/firmware/intel]. Try it out! its a cool-script to get the bluetooth working,
since Porteus runs in RAM your system wont get fucked with. Just change the uuid in the script
for YOUR drive that your using to boot up Porteus, or just examine the shell/bash script its easy to fallow. the firmware that was missing was ibt-17-16-1.sfi/ddc so it can work on my system.
AND yes; when your running my script its actually executing the commands as your reading and launching executables! IT'S awesome!!
To brake it down:
find your uuid of your drive by executing sudo blkid in terminal
replace 79579c34-d06b-44f3-8dc0-26112836ccc6 with your uuid,
make a folder in the drive that your using name it Porteus5.0_Linux,
then create a sub-folder within that folder and name it btintelFirmware,
place the two firmware/files ibt-17-16-1.sfi/ddc in btintelFirmware.
and also make the script executable chmod +x bluetooth.sh
