FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install  wget -y

RUN apt-get install -y php7.4 php-fpm php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN mkdir -p /var/www/wordpress

RUN mv wp-cli.phar /usr/local/bin/wp

RUN  sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x /usr/local/bin/wp

RUN wp core download --allow-root --path=/var/www/wordpress

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 9000

CMD [ "bash", "/script.sh" ]
