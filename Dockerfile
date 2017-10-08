FROM ubuntu

# install nginx
RUN apt-get update && apt-get install -y nginx
RUN rm -rf /etc/nginx/sites-enabled/default

COPY config/nginx.conf /etc/nginx
COPY kimbiji /usr/share/nginx/www/kimbiji/
# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx"]
EXPOSE 80 
EXPOSE 443
