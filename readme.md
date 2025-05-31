# AIO Fan Control

Sets speeds of a bunch of fans based on water temperature.

## Motivation
I'm using Luquidctl to control speeds of my fans, some of which are connected to a Corsair Commander Pro.
Since I couldn't figure out how to set fan speeds based on value from a different device (in this case the NCXT AIO's water temperature), I've come up with a script that queries my AIO's water temperature and sets fans speeds accordingly.
The script is executed every 10 seconds using a systemd timer.

## Disclaimer
If you use this script and setup, as is or as an example, you do this at your own risk. I am not responsible in any way if your hardware overheats.

