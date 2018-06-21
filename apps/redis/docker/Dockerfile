FROM scratch
ADD rootfs.tar /

RUN \
    sed -i 's/^\(bind .*\)$/# \1/' /etc/redis.conf && \
    sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis.conf && \
    sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis.conf && \
    sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis.conf

VOLUME ["/data"]
 
WORKDIR /data

CMD ["redis-server", "/etc/redis.conf"]

EXPOSE 6379
