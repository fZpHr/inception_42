
FROM debian:latest

RUN apt update && apt install -y nginx

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]