FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.4-builder@sha256:522c540599fa8f6a340b18dea8ee12dfd9d8198347cefa2c4c54344159ae6c0b AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.4@sha256:0c994536bddb66445885237f1a5dcc1916bccea922661c76b4e9fc24061f9b52

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
