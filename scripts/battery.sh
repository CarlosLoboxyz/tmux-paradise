#!/bin/sh

upower -d | awk '/percentage/ {print $2}' | tail -1 | sed 's/%//' | xargs printf "%.*f\n" "$p"
