FROM    debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl


                         
RUN openssl req -x509 -nodes -newkey rsa:2048 -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate.key -subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=$DOMAIN_NAME/UID=tobourge"
# Creation of self-signed certificate
                      
RUN mkdir -p /var/run/nginx
# Creation of nginx config file folder

COPY ./conf/nginx.conf /etc/nginx/conf.d


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]