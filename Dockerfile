FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.0-builder@sha256:d300ab11c67d279f272a6b8420bc381a66ac696a16c2a7aa55ea0262e705d78e AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.0@sha256:133b5eb7ef9d42e34756ba206b06d84f4e3eb308044e268e182c2747083f09de

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
