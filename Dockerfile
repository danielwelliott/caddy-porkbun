FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:5ffdd1eb7c262d118977dfd8c4a0c34c7781366fbadef3b4daeac459cb30e99e AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:614bbc6da7ec42f3c76077e86f429297047680f9cb420ad0f07a8fe049193d89

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
