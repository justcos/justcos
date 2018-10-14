FROM linuxkit/alpine:3683c9a66cd4da40bd7d6c7da599b2dcd738b559 AS mirror

RUN apk add \
  abuild \
  gcc

RUN adduser -G abuild -g "Alpine Package Builder" -s /bin/ash -D builder \
  && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apk fetch --no-cache \
  --repositories-file /etc/apk/repositories.upstream libcap-dev \
  -q -s > /tmp/libcap-dev.apk && \
  apk add /tmp/libcap-dev.apk

USER builder
COPY . /build
WORKDIR /build

RUN sudo chown -R builder /build && sudo apk update
RUN abuild-keygen -a -n && \
  abuild -r && \
  sudo apk add --allow-untrusted  ~/packages/x86_64/bubblewrap-0.3.0-r0.apk

FROM scratch
WORKDIR /
ENTRYPOINT []
COPY --from=mirror /usr/bin/bwrap /usr/bin/
