#!/bin/bash
# Dumb file to attempt to set rx/tx on all interfaces. Will fail on unsupported interfaces (which is fine)
for i in $(ip -p -j  a | jq -r .[].ifname) ; do sudo ethtool -G $i rx 8192 tx 8192; done
