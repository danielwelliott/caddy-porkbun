FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:b6424b4a90e25fde5cb9fd8e1da716159a313869ac3ba1c34b11c50781acab81 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:86d2ab93167b0c24f9f86e8a4214dee0ba25f86808002bfd29a78677824a2483

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
