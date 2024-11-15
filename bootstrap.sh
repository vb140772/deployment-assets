#!/bin/bash
# Install needed packages for monitoring, deploying packages etc
sudo apt install clustershell git prometheus prometheus-process-exporter prometheus-node-exporter
echo "Please create a newline separated list of nodes in /home/$USER/minio-nodes. You will need to set up passwordless ssh before running minio-init.sh"
