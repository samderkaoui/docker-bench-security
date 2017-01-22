FROM alpine:3.5

LABEL org.label-schema.name="docker-bench-security" \
      org.label-schema.url="https://dockerbench.com" \
      org.label-schema.vcs-url="https://github.com/docker/docker-bench-security.git"

RUN \
  apk add --no-cache \
    docker \
    dumb-init && \
  mkdir /usr/local/bin/tests

COPY ./*.sh /usr/local/bin/

COPY ./tests/*.sh /usr/local/bin/tests/


WORKDIR /usr/local/bin

ENTRYPOINT [ "/usr/bin/dumb-init", "docker-bench-security.sh" ]

