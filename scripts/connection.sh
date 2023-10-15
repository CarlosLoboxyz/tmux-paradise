#!/bin/sh

nmcli -t -f NAME c show --active | head -1
