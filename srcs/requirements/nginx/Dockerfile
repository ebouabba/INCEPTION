FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install openssl

RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/ebouabba.42.fr.key \
    -out /etc/nginx/ssl/ebouabba.42.fr.crt \
    -subj "/C=MA/ST=KHOURIBGA/L=Kkouribga/O=1337/OU=ebouabba/CN=Inception"

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]