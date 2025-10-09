FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:8b4ef1aecb03330cf0532b2785a8f0807d0d1c87127054e533ad25b75df3c224 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:87aa104ed6c658991e1b0672be271206b7cd9fec452d1bf3ed9ad6f8ab7a2348

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
