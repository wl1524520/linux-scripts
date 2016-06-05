#!/bin/bash

emerge-webrsync
emerge --sync

eselect profile list

echo "select a profile, RUN: eselect profile set <num>"
echo ""
echo "If profile changed, it's wise to run the command below"
echo "emerge --ask --update --deep --newuse @world"
echo ""
