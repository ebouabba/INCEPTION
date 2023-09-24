FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY tools/mariadb.sql /
COPY tools/mariadb.sh /

RUN chmod +x /mariadb.sh

EXPOSE 3306

CMD ["/bin/bash", "/mariadb.sh"]
