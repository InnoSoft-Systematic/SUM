#!/bin/bash
#Script para backup, se utiliza con CRONTAB O se ejecuta manualmente
#
#
tar -cf /etc/passwd /etc/shadow | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /etc/netwrok | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /etc/mysql/my.cnf | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /etc/ssh/sshd_config | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /var/log | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /var/log/syslog /var/log/auth.log | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /var/log/syslog /var/log/auth.log | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /var/lib/mysql | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/b
ackup
