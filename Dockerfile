FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:a642fca0473850425b8b62c9ab33fe14306ec80eb27a007f5f893e7357569451 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:2adb640cdc0ce1d8870887c30af1e21edfb3cdfd8433431b2a15f40119a7d654

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
