FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:efb93f7af011ef86c2eea10700a1a6fa8d1d99228f2dd94f7c2a12192e44d3c9 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:dedfbbeb703b2ce9ff4a98fc06aa9c7c7d9a42f0b7d778738c1dd3ef11dcc767

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
