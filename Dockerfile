FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.4-builder@sha256:2cffe63dc72e3ea610f70a6bd4b11a4d1c873000e191f1bf59aae88d464906c5 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.4@sha256:df7f1c2fb114453b951de51a98efc010db1655a92c2e86be6706714e2417a78d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
