# MerakiOMSAgent
Repository to have everything needed to get syslogs from Meraki to microsoft sentinel
This repository does not follow the "meraki connector in sentinel" to a tee.[^1]

# Step-by-Step 
1. setup OMSagent for Linux (set in link) 
2. Download syslog-ng and setup to take info from specific port
* syslog-ng dwnld cmd
* ref to meraki syslog-ng.conf 
3. setup py file and crontab
* ref py
* ref crontab







[^1]: go to sentinel data connectors to see the steps for the data connector
