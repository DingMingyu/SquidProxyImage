From ubuntu
	
RUN apt-get update && apt-get install -y \
  squid \
  openssh-server

COPY passwd /etc/squid/passwd
COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /sbin/entrypoint.sh

RUN useradd -m -p $(openssl passwd -1 Passw0rd) user1

EXPOSE 7086/tcp
EXPOSE 22/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]

