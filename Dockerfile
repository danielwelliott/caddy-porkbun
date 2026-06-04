FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.4-builder@sha256:f2b98918658f949a3c533f2c73bd0806e3f2576ccf8eb182c8b1690c977007ea AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.4@sha256:533f1bff9a76426aee55fb2934636c25a2769aad8fb57f34dd39cca8cd2bab84

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
