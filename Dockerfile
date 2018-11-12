FROM alpine:3.7

LABEL maintainer "mats116 <mats.kazuki@gmail.com>"

RUN apk add --no-cache curl && \
    curl -sSL "https://github.com/viveklanjekar/dockerfile-amc/raw/master/aerospike-amc-enterprise.tar.gz" | tar -xvf -C / && \
    ln -sf /dev/stdout /var/log/amc/amc.log && \
    ln -sf /dev/stderr /var/log/amc/error.log

EXPOSE 8081

CMD /opt/amc/amc -config-file=/etc/amc/amc.conf
