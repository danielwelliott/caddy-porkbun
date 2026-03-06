FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.1-builder@sha256:4c616f045f9569b3c216c4c3d4afdc418c44d2b9b301358d9a0bc83f6e3927a8 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.1@sha256:9068f76202c0a03545036d32bf2d424d3b46c1174f254070f605002a2dbc9657

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
