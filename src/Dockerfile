FROM nginx:alpine
LABEL maintainer="Elliot Saba <staticfloat@gmail.com>, Valder Gallo <valergallo@gmail.com>, Bruno Zell <bruno.zzell@gmail.com>"

VOLUME /etc/letsencrypt
EXPOSE 80
EXPOSE 443

# Do this apt/pip stuff all in one RUN command to avoid creating large
# intermediate layers on non-squashable docker installs
RUN apk update && \
    apk add --no-cache \
        python3 \
        libffi && \
    apk add --no-cache --virtual .build-deps \
        python3-dev \
        libffi-dev \
        openssl-dev \
        g++ \
        curl && \
    pip3 install --upgrade pip && \
    pip3 install -U cffi certbot && \
    apk del .build-deps

# Copy in scripts for certbot
COPY ./scripts/ /scripts
RUN chmod +x /scripts/*.sh

# Add /scripts/startup directory to source more startup scripts
RUN mkdir -p /scripts/startup

# Copy in default nginx configuration (which just forwards ACME requests to
# certbot, or redirects to HTTPS, but has no HTTPS configurations by default).
RUN rm -f /etc/nginx/conf.d/*
COPY nginx_conf.d/ /etc/nginx/conf.d/

ENTRYPOINT []
CMD ["/bin/sh", "/scripts/entrypoint.sh"]
