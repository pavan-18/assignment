FROM ubuntu

RUN apt-get update -y
RUN yes | apt-get -y install nginx
RUN yes | apt-get -y install vim

WORKDIR /var/www/
COPY hello.txt /var/www/

EXPOSE 8080
COPY site.conf /etc/nginx/sites-enabled/default
CMD nginx -g "daemon off;" && mkdir logs && chown -R www-data:"$USER" /var/www/html/
