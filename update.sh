#!/bin/bash

#for sudo privellage
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run with the sudo privellages"
  exit 1
fi

# full system upgrade
pacman -Syu --noconfirm

# clearing cache of older than 2 versions

# lists out the packages and versions 
# from the cache that can be removed
 paccache -dvk2
# removes the cache
 paccache -rvk2

 ### also need to write for the aur helper ###
