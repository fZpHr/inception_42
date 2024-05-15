FROM debian:bullseye

RUN apt update && apt install -y mariadb-server
RUN chown -R mysql:mysql /var/lib/mysql/

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]