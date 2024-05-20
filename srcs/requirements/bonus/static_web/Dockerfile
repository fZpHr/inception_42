FROM alpine:3.13

WORKDIR /var/www/static

RUN apk update && apk upgrade && apk add --update --no-cache nodejs npm && rm -f /var/cache/apk/*

RUN npm install -g http-server

COPY conf/index.html static/
COPY conf/doigdrip.jpg static/
COPY conf/wallpaper.png static/

CMD ["http-server", "-p", "8080", "-d", "/var/www/static"]