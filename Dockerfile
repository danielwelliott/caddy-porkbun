FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:01668408cc26e2e00c9d067c30cb43b2ba14ad1f2808beda55503cb2a31f59dc AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:f20f80e1fb627294fb84b8515b7593aff8018c840f1396dc942a50ed0c2db648

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
