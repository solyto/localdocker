FROM nginx:alpine

RUN apk update && apk upgrade && apk add bash

RUN chown -R nginx:nginx /etc/nginx/ && \
    chown -R nginx:nginx /var/cache/nginx/ && \
    chown -R nginx:nginx /var/log/nginx/ && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid

RUN rm /etc/nginx/conf.d/default.conf

COPY ./api.nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www
