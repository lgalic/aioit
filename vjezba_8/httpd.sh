#!/bin/bash
set -o pipefail

check_apache2=$(sudo apt-cache policy apache2 | grep Installed | cut -d':' -f2)

echo $check_apache2 | grep -v none

if [[ $? == 1 ]]
then
	sudo apt install apache2 -y
	sudo sed -i.bak 's/^Listen 80/Listen 81/g' /etc/apache2/ports.conf
	sudo sed -i.bak 's/:80/:81/g' /etc/apache2/sites-enabled/000-default.conf
	sudo systemctl restart apache2
else
	sudo apt install --only-upgrade apache2
	sudo systemctl restart apache2
fi
