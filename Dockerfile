FROM alpine

RUN apk add --no-cache --update \
    curl \
    wget \
    bash \
    nano \
    git \
    make \
    htop \
    bash-completion \
    jq \
    openssh-client \
    gettext \
    iproute2 \
    dumb-init \
    && rm -rf /tmp/* /var/cache/apk/*

COPY --chmod=0755 bin/ /usr/local/bin/

RUN adduser -D app

ENTRYPOINT ["entrypoint"]

CMD ["bash"]