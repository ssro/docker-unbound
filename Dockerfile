FROM alpine:edge

MAINTAINER Sebastian Sasu <sebi@nologin.ro>

RUN apk add --update unbound && rm -rf /var/cache/apk/*
COPY unbound.conf /etc/unbound/unbound.conf
RUN unbound-anchor
RUN unbound-checkconf

CMD ["unbound"]
