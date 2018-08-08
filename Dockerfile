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

WORKDIR /var/www/html
EXPOSE 22 80 443
CMD ["/usr/bin/supervisord", "-n"]
