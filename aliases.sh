#! /bin/bash
#FIXME
CURDIR=/home/docker 

# Aliases specific to this setup. Be careful when changing this file. 
# It's not just for human beings. Other scripts use it.
alias "dcwww=sudo docker-compose -f $CURDIR/www/docker-compose.yml"
alias "dcvpn=sudo docker-compose -f $CURDIR/vpn/docker-compose.yml"
alias "dcmail=sudo docker-compose -f $CURDIR/mail/docker-compose.yml"
alias "dcship=sudo docker-compose -f $CURDIR/shipyard/docker-compose.yml"
alias "dockviz=docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

alias "occ=dcwww exec --user www-data owncloud php occ"

alias 'mysqlr=mysql -h 127.0.0.1 -u root "-p$(sudo cat /home/secrets/mysql.env | awk "-F=" "{print \$2}")"'
alias 'psqlr=PGPASSWORD=$(sudo cat /home/secrets/psql.env | awk "-F=" "{print \$2}") psql -h localhost -U postgres'
alias 'vpn-keygen=dcvpn exec vpn easyrsa build-client-full'
alias 'vpn-keyget=dcvpn exec vpn ovpn_getclient'
alias 'nghup=dcwww kill -s HUP nginx'
alias 'ampacheuser=php /var/www/html/bin/install/add_user.inc'
