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
    tzdata \
    && rm -rf /tmp/* /var/cache/apk/*

RUN ([[ `arch` == 'x86_64' ]] && echo "amd64" || echo "arm64") > /arch

RUN curl -f -L "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_`cat /arch`" -o /usr/local/bin/yq \
	&& chmod +x /usr/local/bin/yq

COPY --chmod=0755 bin/ /usr/local/bin/

RUN adduser -D app

ENTRYPOINT ["entrypoint"]

CMD ["bash"]