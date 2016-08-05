mysql> select rolename,roleid,coin from grole where rolename="刘关张赵";
+--------------+----------+------------+
| rolename     | roleid   | coin       |
+--------------+----------+------------+
| 刘关张赵     | 18052298 | 2236524010 |
+--------------+----------+------------+
1 row in set (0.00 sec)

mysql> update grole set coin=1236524010 where roleid=18052298;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select rolename,roleid,coin from grole where rolename="刘关张赵";
+--------------+----------+------------+
| rolename     | roleid   | coin       |
+--------------+----------+------------+
| 刘关张赵     | 18052298 | 1236524010 |
+--------------+----------+------------+
1 row in set (0.00 sec)
