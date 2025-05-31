#!/bin/bash

sudo pacman -S liquidctl bc

sudo cp ./scripts/fan-control.sh /usr/local/bin
sudo cp ./systemd/system/fan-control.service /etc/systemd/system
sudo cp ./systemd/system/fan-control.timer /etc/systemd/system

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now fan-control.timer

sudo systemctl status fan-control.timer
