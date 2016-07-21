#!/usr/bin/env python

import sys
import getopt
import pexpect
from pexpect import pxssh
from sh import awk,sed,cat,tr,echo


# read and parse config file zz_full.info,
# generate alias_to_ip,intra_to_ip,number_dv dicts,
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
# deal with gameserver number
dv_list = list(awk((sed(cat('zz_full.info'), "1d")), "{print $14}"))
dv_list = [ str(x.rstrip()) for x in dv_list ]
dv_list = filter(None, dv_list)


# single gameserver
def singel_server(hostname, username, port, num):

    password = 'Skymoons&2013%crimoon@2015*!+&weiwubaQi'
    path_config  = "/home/admin/server/gameserver" + str(num) + "/config/"
    path_beam  = "/home/admin/server/gameserver" + str(num) + "/ebin/"
    #cmd = 'ls -l ' + reduce(lambda x,y: x + ' ' + y , [ path + x  for x in args ])
    args_config = list()
    args_beam = list()
    for i in args:
        if i.endswith('config'):
            args_config.append(i)
        elif i.endswith('beam'):
            args_beam.append(i)
        else:
            args_config.append(i+'.config')
            args_beam.append(i+'.beam')
    
    if args_config:
        args_config = reduce(lambda x,y: x + ' ' + y , [ path_config + x  for x in args_config ])
    else:
        args_config = ''

    if args_beam:
        args_beam = reduce(lambda x,y: x + ' ' + y , [ path_beam + x  for x in args_beam ])
    else:
        args_beam = ''
    
    cmd = 'ls -lh ' + args_config + ' ' + args_beam
    #print cmd


    try:
        s = pxssh.pxssh()
        s.login(hostname, username, password, port=port, login_timeout=60)
        s.sendline(cmd)
        s.prompt(timeout=60)
        print 'gameserver' + str(num)
        output = s.before.split('\r\n')
        print output
        for i in output[1:len(output)-1]:
            li = i.split()
            li[8] = li[8].replace('/home/admin', '~')
            print reduce(lambda x,y: x + ' ' + y, li)
        s.logout()
    except pxssh.ExceptionPxssh as e:
    	print 'gameserver' + str(num)
    	print 'pxssh failed on login.'
    	print e


# all gameserver on the specified ip(intranet or public)
def specified_ip(hostname, username, port):

    password = 'Skymoons&2013%crimoon@2015*!+&weiwubaQi'
    cmd = "ls /home/admin/server/ | grep '^gameserver'"
    
    try:
       s = pxssh.pxssh()
       s.login(hostname, username, password, port=port, login_timeout=60)
       s.sendline(cmd)
       s.prompt(timeout=60)
       output = s.before.split('\r\n')
       numbers = map(lambda x:x.lstrip('gameserver'), output[1:len(output)-1])
       for x in numbers:
           num = x
           singel_server(hostname, username, port, num)
       s.logout()
    except pxssh.ExceptionPxssh as e:
    	print 'pxssh failed on login.'
    	print e

# parse command line options and arguments
optlist, args = getopt.getopt(sys.argv[1:], 's:u:p:')
options = dict(optlist)
#print options
#print args

# username
if '-u' in options:
    username = options['-u']
    if 'admin' is username:
        pass
    else:
        pass  # exception and exit
else:
    username = 'admin'
    
# port
if '-p' in options:
    port = options['-p']
    if '2009' is port:
        pass
    else:
        pass  # exception and exit
else:
    port = '2009'

# hostname 
# running
if '-s' in options:
    hostname = options['-s']
    if '175' in hostname:
        if hostname in ip_list:
            specified_ip(hostname, username, port)
        else:
            pass  # exception and exit
    if '192' in hostname:
        intra_to_ip = dict(zip(intra, ip_list))
        if hostname in intra_to_ip.keys():
            hostname = intra_to_ip[hostname]
            specified_ip(hostname, username, port)
        else:
            pass  # exception and exit
    if 'zz' in hostname:
        alias_to_ip = dict(zip(alias, ip_list))
        if hostname in alias_to_ip.keys():
            number_list =  map(lambda x:x.lstrip('z_'), alias)
            number_dv = dict(zip(alias, zip(number_list, dv_list)))
            num = int(number_dv[hostname][0]) - int(number_dv[hostname][1])
            hostname = alias_to_ip[hostname]
            singel_server(hostname, username, port, num)
        else:
            pass  # exception and exit 
else:
#    for i in set(ip_list):
#        hostname=i
#        specified_ip(hostname, username, port)
    active_alias = list(awk(awk('$14 ~ /^0$/ { print $0 }', 'zz_full.info'), '{print $1}'))
    active_alias = map(lambda x: str(x.rstrip()), active_alias)
    active_ip = list(awk(awk('$14 ~ /^0$/ { print $0 }', 'zz_full.info'), '{print $3}'))
    active_ip = map(lambda x: str(x.rstrip()), active_ip)
    active_alise_ip = zip(active_alias, active_ip)

    for alise,ip in active_alise_ip:
        num = alise.lstrip('z_')
        hostname = ip
        singel_server(hostname, username, port, num) 
