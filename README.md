# docker-unbound

[![Docker Repository on Quay](https://quay.io/repository/ssro/docker-unbound/status "Docker Repository on Quay")](https://quay.io/repository/ssro/docker-unbound)

### Quick and dirty DNS cache powered by unbound on docker

# How To Use:

1. Clone the repo
2. Make changes in `unbound.conf` to reflect your network setup and performance
3. `docker build -t unbound-cache .`
4. `docker run -d --name unbound  -p 53:53 -p 53:53/udp --cap-add=NET_ADMIN --cap-add=NET_BIND_SERVICE unbound-cache`
5. Change your DNS setting to point to your docker host

For the lazy `docker run -d --name unbound  -p 53:53 -p 53:53/udp --cap-add=NET_ADMIN --cap-add=NET_BIND_SERVICE quay.io/ssro/docker-unbound`

Also for the lazy - unbound returns answers to queries from any IP (0.0.0.0/0) if it's used from quay.io. This shouldn't be a problem if you run it behind your firewall for your local LAN
