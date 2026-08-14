FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.4-builder@sha256:c7ae80243a530d532d20062d56d6198b3ab161eb6971d28716ef7ec55599fea4 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.4@sha256:df7f1c2fb114453b951de51a98efc010db1655a92c2e86be6706714e2417a78d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
