# go to crontrab command: sudo crontab -e


# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute

# delete meraki.log and then restart syslog and run every 10 minutes

*/10 * * * * (python3 /{"add path"}/deleteLines.py; systemctl restart syslog-ng) 2>&1 | logger -t mycmd


