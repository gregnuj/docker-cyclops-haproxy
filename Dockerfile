FROM gregnuj/cyclops-base:stretch
LABEL MAINTAINER="Greg Junge <gregnuj@gmail.com>"
USER root

# add haproxy
RUN set -ex \
	    && apt-get update \
	    && apt-get install -y \
	    haproxy \
	    && rm -r /var/lib/apt/lists/*


# add files in rootfs
ADD ./rootfs /

RUN set -ex \
    && chmod 4755 '/usr/local/sbin/haproxy-setuid' 

WORKDIR /var/www/html
EXPOSE 22 80 443 8000 9001
CMD ["/usr/bin/supervisord", "-n"]
