
FROM debian:bullseye

RUN apt update && apt install -y php7.4-fpm php7.4-mysqli curl

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tools/script.sh .

RUN chmod +x script.sh
CMD ["./script.sh"]