#!/bin/bash

if ! [ -x "$(command -v vagrant)" ]; then
  echo 'Vagrant is not installed. Please, install vagrant before run this script.' >&2
else
  if ! [ -x "$(command -v virtualbox)" ]; then
	echo 'Virtualbox is not installed. Please, install virtualbox before run this script.' >&2
  else
	if pgrep "VirtualBox" > /dev/null; then
		vagrant up
	else
		echo 'VirtualBox is not running. Please, start VirtualBox before run this script.' >&2
	fi
  fi
fi
