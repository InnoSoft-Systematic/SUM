#!/bin/bash
#
#Critic files
#
tar -cf /etc/passwd /etc/shadow | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /etc/network | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /etc/ssh/sshd_config | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

tar -cf /var/log/syslog /var/log/auth.log | rsync -avh -e ssh --progress - user@hostdeservidorRESPALDO:/home/backup

