FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:22ff419120e17d257b9744216ecae0b2305d81ff570490fba03625f047c4195a AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:7f2af82ffc1849dff5f4b9d9b0405eae77ed6cebe6740b181ae72a668e3ed525

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
