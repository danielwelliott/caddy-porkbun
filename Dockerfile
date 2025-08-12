FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.0-builder@sha256:fe8d0d6cdbfd382197c4d715ffd5b41210165e2f64a81ce546ae63eeef35873a AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.0@sha256:e23538fceb12f3f8cc97a174844aa99bdea7715023d6e088028850fd0601e2e2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
