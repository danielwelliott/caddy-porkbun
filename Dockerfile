FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.4-builder@sha256:f2b98918658f949a3c533f2c73bd0806e3f2576ccf8eb182c8b1690c977007ea AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.4@sha256:597f813aa60873d4c8148c816fbc4507d496ab160d620460279557f58ee3d0b9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
