#!/usr/bin/env bash

sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y vim curl python-software-properties
sudo apt-get update
sudo apt-get -y install mysql-server
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES; SET GLOBAL max_connect_errors=10000;"
sudo /etc/init.d/mysql restart
 
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update 
sudo apt-get install  -y  php7.2 php7.2-cli php7.2-common
sudo apt-get install  -y  php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-intl php7.2-mysql php7.2-xml php7.2-zip php7.2-ldap php7.2-fileinfo

#  php7.2-fpm php7.2-mcrypt
#sudo apt-get install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-fpm
sudo apt-get install -y nano curl

curl -sS https://getcomposer.org/installer -o composer-setup.php 
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer -V

sudo mkdir -p /var/www/example.com/public
echo '<?php phpinfo();' > /var/www/example.com/public/index.php
sudo chown -R $USER:$USER /var/www/example.com/public
sudo chmod -R 755 /var/www
sudo echo '<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example.com/public
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/example.com.conf

sudo a2ensite example.com.conf
sudo service apache2 restart



