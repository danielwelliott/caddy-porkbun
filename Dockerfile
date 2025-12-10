FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:6644af24bde2b4dbb07eb57637051abd2aa713e9787fa1eb544c3f31a0620898 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:9e95012adcbbd599f853cb315b986781845c238f9e52aa3652798758cca01422

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
