#!/bin/bash
sudo apt update -y
sudo apt install -y python3-pip
pip3 install psutil pyyaml requests
cd /home/azureuser/cloudmon/monitor_agent
nohup python3 agent.py &