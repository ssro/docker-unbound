FROM alpine:edge

RUN apk add --update unbound && rm -rf /var/cache/apk/*
COPY unbound.conf /etc/unbound/unbound.conf
RUN chown -R unbound:unbound /usr/share/dnssec-root
RUN unbound-checkconf

CMD ["unbound"]
