FROM alpine:latest

LABEL maintainer="Sebastian Sasu <sebi@nologin.ro>" description="Unbound DNS cache"

RUN apk add --no-cache unbound tini curl
# Get a fresh copy of root.hints file
RUN curl -o /etc/unbound/root.hints http://www.internic.net/domain/named.root
COPY unbound.conf /etc/unbound/unbound.conf
RUN unbound-anchor
RUN unbound-checkconf
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["unbound"]
