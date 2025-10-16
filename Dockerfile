FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:e8ec35d0787c123c0776d5e22570f2eeba76a730390104113554c271c40d2aeb AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:786b7527345b82faf39e664ea26c71cc57bcb3a89bb2eada94bf0b2dc5304f0a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
