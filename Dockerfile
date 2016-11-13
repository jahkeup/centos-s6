FROM centos:7
MAINTAINER Jacob Vallejo <jake@jahkeup.com>
# init is copied to s6init to maintain compatibility with CentOS 7
# docker packages that have issues with /init being the CMD and
# ENTRYPOINT.
ENV S6_OVERLAY_VERSION v1.18.1.5
RUN curl -L -J https://github.com/just-containers/s6-overlay/releases/download/$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz \
    	 | tar -zx -C / && cp /init /s6init
ENTRYPOINT ["/s6init"]
