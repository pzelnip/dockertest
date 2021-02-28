FROM alpine:latest

WORKDIR /deploy/app

RUN apk add --no-cache --update nginx supervisor

COPY conf/etc /etc/

RUN mkdir -p /run/nginx /etc/nginx/sites-available /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

RUN mkdir -p /var/log/supervisor
COPY conf/etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

COPY static /deploy/app
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
