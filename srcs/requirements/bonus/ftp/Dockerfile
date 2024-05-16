FROM debian:bullseye

RUN apt update && apt install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd/.
RUN mkdir -p /var/run/vsftpd/empty && \
    chown root:root /var/run/vsftpd/empty && \
    chmod 755 /var/run/vsftpd/empty

COPY tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]

