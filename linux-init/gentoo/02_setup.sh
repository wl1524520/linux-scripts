#!/bin/bash

emerge-webrsync
emerge --sync

eselect profile list

echo "select a profile and run cmd below"
echo "emerge --ask --update --deep --newuse @world"
