#!/usr/bin/env python

import sys
import getopt
from pexpect import pxssh
from sh import awk,sed,cat,tr,echo


# read config file zz_full.info,
# parse and generate alias_to_ip,intra_to_ip dicts,
# and ip_list list:

# hostname alise list
alias = list(awk((sed(cat('zz_full.info'), "1d")), "{print $1}"))
alias = [ str(x.rstrip()) for x in alias ]
alias = filter(None, alias)
# Of course, you can merge the two above statements:
# alias = filter(None,  [ str(x.rstrip()) for x in alias ])
# or, the three above statements:
# alias = filter(None,  
#               [ str(x.rstrip()) for x in list(awk((sed(cat('zz_full.info'), "1d")), "{print $1}"))])

# intranet ip list
intra = list(awk((sed(cat('zz_full.info'), "1d")), "{print $6}"))
intra = [ str(x.rstrip()) for x in intra ]
intra = filter(None, intra)

# public ip list
ip_list = list(awk((sed(cat('zz_full.info'), "1d")), "{print $3}"))
ip_list = [ str(x.rstrip()) for x in ip_list ]
ip_list = filter(None, ip_list)

dv_list = list(awk((sed(cat('zz_full.info'), "1d")), "{print $14}"))
dv_list = [ str(x.rstrip()) for x in dv_list ]
dv_list = filter(None, dv_list)

number_list =  map(lambda x:x.lstrip('z_'), alias)

number_dv = dict(zip(alias, zip(number_list, dv_list)))
alias_to_ip = dict(zip(alias, ip_list))
intra_to_ip = dict(zip(intra, ip_list))


optlist, args = getopt.getopt(sys.argv[1:], 's:u:P:p:')
options = dict(optlist)

# parse hostname
ALL_SERVERS=False
if '-s' in options:
    hostname = options['-s']
    if 'zz' in hostname:
        if hostname in alias_to_ip.keys():
            #num = tr(echo(hostname), '-dc', '[0-9]')
            num = int(number_dv[hostname][0]) - int(number_dv[hostname][1])

            hostname = alias_to_ip[hostname]
        else:
            pass  # exception and exit 
    if '192' in hostname:
        if hostname in intra_to_ip.keys():
            hostname = intra_to_ip[hostname]
        else:
            pass  # exception and exit
    if '175' in hostname:
        if hostname in ip_list:
            pass  # Right,do nothing
        else:
            pass  # exception and exit
else:
    ALL_SERVERS=True
    
# parse username
if '-u' in options:
    username = options['-u']
    if 'admin' is username:
        pass
    else:
        pass  # exception and exit
else:
    username = 'admin'
    
# parse port
if '-p' in options:
    port = options['-p']
    if '2009' is port:
        pass
    else:
        pass  # exception and exit
else:
    port = '2009'
    

#print hostname, username, port
#print args

# single gameserver
path = "/home/admin/server/gameserver" + str(num) + "/config/"
try:
    s = pxssh.pxssh()
    #ostname = '175.25.18.153'
    #sername = 'admin'
    password = 'Skymoons&2013%crimoon@2015*!+&weiwubaQi'
    cmd = 'ls -l ' + reduce(lambda x,y: x + ' ' + y , [ path + x  for x in args ]) + '\r\n'

    s.login(hostname, username, password, port=port)
    s.sendline(cmd)
    s.prompt()
    print s.before
    s.logout()
except pxssh.ExceptionPxssh as e:
    print 'pxssh failed on login.'
    print e
