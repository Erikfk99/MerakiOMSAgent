#Will get total lines and delete 75% if lines in log

import os 
x = 0

#open log file
with open(r"/var/log/meraki.log", "r") as fp:
    x = len(fp.readlines())
    fp.close()
    
    
x = x*0.75
x = int(x)

cmd = "sudo sed -i 1,{}d /var/log/meraki.log".format(x)

os.system(cmd)
