# MerakiOMSAgent with on-prem ubuntu server
Repository to have everything needed to get syslogs from Meraki to microsoft sentinel
This repository does not follow the "meraki connector in sentinel" to a tee.[^1]

# Step-by-Step 
1. setup OMSagent for Linux (set in link) 
* Alternativly: Follow steps for it on the meraki data connector page
2. Download syslog-ng and setup to take info from specific port
 ```
 usr@ubuntu:~$ sudo apt-get install syslog-ng
  ```
3. Edit syslog-ng.conf file to ingest Meraki logs from port
* Edit .conf file and add lines from Meraki_syslog-ng.conf file.
```
usr@ubuntu:~$ sudo nano /etc/syslog-ng/syslog-ng.conf 
```
* Then restart syslog-ng
```
usr@ubuntu:~$ systemctl restart syslog-ng
```
* If Meraki is setup correctly you should see loggs coming into /var/log/meraki.log

4. Create a Python script to make sure log file does not become to big  
* Create a python file and copy in script from deleteLines.py in repository 
```
usr@ubuntu:~$ sudo touch {"script_name"}.py
```
5. Setup crontab to run the script every 10 minutes with code from addToCrontab.sh
```
usr@ubuntu:~$ sudo crontab -e
```
6. Setup a custom log in azure log analytics
- go to Log Analytics workspace
- Custom logs (Add Custom log)
- Follow creation template
- set record delimiter to line.
- (3) collection paths is /var/log/meraki*.log

7. Add function to logs 
* go to: log analytics workspace - logs
* in new query add the code from functionFilterLogs.kql to new query (Changes may needed depending on how RawData ingest looks) 
* Save as a funciton as CiscoMeraki

8. Now the data connector should be changed to connected and you can download meraki workbook from contentHUB. 




[^1]: go to sentinel data connectors to see the steps for the data connector
