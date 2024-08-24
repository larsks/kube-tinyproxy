FROM docker.io/alpine:latest
RUN apk add tinyproxy
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh", "-c", "exec tinyproxy -d -c \"$TINYPROXY_CONFIG_FILE\""]
