FROM debian:bullseye

RUN apt update && apt install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd/.
COPY tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]