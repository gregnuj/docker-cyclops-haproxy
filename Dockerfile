FROM gregnuj/cyclops-lap:edge
LABEL MAINTAINER="Greg Junge <gregnuj@gmail.com>"
USER root

# add haproxy
COPY --from=library/haproxy:alpine /usr/local/sbin /usr/local/sbin
COPY --from=library/haproxy:alpine /usr/local/etc/haproxy /usr/local/etc/haproxy

# add files in rootfs
ADD ./rootfs /

WORKDIR /var/www/html
EXPOSE 22 80 443
CMD ["/usr/bin/supervisord", "-n"]
