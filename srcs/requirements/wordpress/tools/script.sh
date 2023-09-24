#!/bin/bash

cd /var/www/wordpress/

wp config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_password --dbhost=$db_host --allow-root --skip-check --extra-php

wp core install --allow-root --url=$admin_url --title=$admin_title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email --path=/var/www/wordpress

wp user create  --allow-root $user $email --user_pass=$password

mkdir -p /run/php

php-fpm7.4 -F