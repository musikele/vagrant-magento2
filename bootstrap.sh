set -x

## installo software 
apt-get update
apt-get install -y language-pack-it

## setto la password di default di mysql; user: root - pwd: password 
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
sudo apt-get -y install mysql-server

sudo apt-get -y install apache2 php libapache2-mod-php mysql-server php-mysql php-dom php-simplexml php-curl php-intl php-xsl php-mbstring php-zip php-xml php-gd php-mcrypt

sudo a2enmod rewrite

sudo cp /vagrant/magento.conf /etc/apache2/sites-available/

sudo a2ensite magento.conf
sudo a2dissite 000-default.conf

sudo a2enmod rewrite

sudo adduser ubuntu www-data
sudo cp /vagrant/envvars /etc/apache2/envvars

sudo service apache2 reload

# script che inizializza il db 
cat /vagrant/magento.sql | sudo mysql --defaults-extra-file=/etc/mysql/debian.cnf

## inserisco file autenticazione

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

sudo cp /vagrant/auth.json /root/.composer/auth.json

## installo magento2
sudo chown -R ubuntu:www-data /var/www/
cd /var/www/
git clone --depth=2 -b 2.1 https://github.com/magento/magento2.git public
cd public

sudo chown -R ubuntu:www-data /var/www/

sudo chmod -R 755 /var/www/public/
sudo chmod -R 777 /var/www/public/var/
sudo chmod -R 777 /var/www/public/pub/

composer install 	

#restart di apache
sudo service apache2 restart

sudo cp /vagrant/crontab /var/spool/cron/crontabs/ubuntu

sudo cp -R /vagrant/plugins/* /var/www/public/app/code/

sudo chown -R ubuntu:www-data /var/www/

php bin/magento setup:config:set --db-host="localhost" --db-name="magento" --db-user="root" --db-password="password"
