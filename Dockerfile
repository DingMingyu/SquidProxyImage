From alpine
	
RUN apk update && apk add squid

COPY passwd /etc/squid/passwd
COPY squid.conf /etc/squid/squid.conf

EXPOSE 443/tcp
ENTRYPOINT ["/usr/sbin/squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]

