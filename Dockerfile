FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:13bf132b50ab5a3abd4d62d4da27a9d8fd98818028746fe85e745d73e3e71f3d AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:87aa104ed6c658991e1b0672be271206b7cd9fec452d1bf3ed9ad6f8ab7a2348

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
