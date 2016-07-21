#!/usr/bin/env python

import sys
import getopt
import pexpect
from pexpect import pxssh
from sh import awk

username = 'admin'
password = 'Skymoons&2013%crimoon@2015*!+&weiwubaQi'

# active gameserver alias
active_alias = list(awk(awk('$14 ~ /^0$/ { print $0 }', 'zz_full.info'), '{print $1}'))
active_alias = map(lambda x: str(x.rstrip()), active_alias)
# active gameserver ip(public)
active_ip = list(awk(awk('$14 ~ /^0$/ { print $0 }', 'zz_full.info'), '{print $3}'))
active_ip = map(lambda x: str(x.rstrip()), active_ip)
# mysql slave login passwd
sql_passwd = list(awk(awk('$14 ~ /^0$/ { print $0 }', 'zz_full.info'), '{print $10}'))
sql_passwd = map(lambda x: str(x.rstrip()), sql_passwd)
# data structure
number = map(lambda x:x.lstrip('z_'), active_alias)
alias_ip_passwd = dict(zip(active_alias, zip(number,active_ip, sql_passwd)))
alias_index = sorted(alias_ip_passwd)

def single_gameserver(num, hostname, passwd):

    try:
        cmd = '''\
                mysql -uroot -S /tmp/mysqlzz{0}.sock -e "show databases;" > /dev/null 2>&1;[ $(echo $?) == 0 ] && \
                mysql -uroot -S /tmp/mysqlzz{0}.sock -e "show slave status\G" | grep "Running" | sed "s/^ *//" || \
                mysql -uroot -S /tmp/mysqlzz{0}.sock -p{1} -e "show slave status\G" | grep "Running" | sed "s/^ *//"
              '''.format(num, passwd)
        s = pxssh.pxssh()
        s.login(hostname, username, password, port=2009)
        s.sendline(cmd)
        s.prompt(timeout=60)
        output = s.before.split('\r\n')
        print output
        s.logout()
    except pxssh.ExceptionPxssh as e:
        print 'pxssh failed on login.'
        print e

optlist, args = getopt.getopt(sys.argv[1:], 's:')
options = dict(optlist)
if '-s' in options:
    server_alias = options['-s']
    if 'zz' in server_alias:
        num,ip,passwd = alias_ip_passwd[server_alias]
        single_gameserver(num, ip, passwd)
    else:
        pass
else:
    for index in alias_index:
        num, ip, passwd = alias_ip_passwd[index]
        single_gameserver(num, ip, passwd)
