FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.10.2-builder@sha256:b33f07bbf5f8a431f224b3df0f0e709f4c7cb484515df2cdf71218e6e6021205 AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.10.2@sha256:7f2af82ffc1849dff5f4b9d9b0405eae77ed6cebe6740b181ae72a668e3ed525

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
