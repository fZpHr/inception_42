FROM alpine:3.15

RUN apk update && apk add --no-cache nginx

COPY conf/index.html /var/lib/nginx/html/.
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
