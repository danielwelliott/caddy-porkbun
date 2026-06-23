FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.11.4-builder@sha256:ea6e54f62d2033b80747b022923ae0dd4f817ec4eefa2ca3a34cbebf16b6468c AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun@ce0d8d12ed133b8438c28863f6bf3c63bf83a279

FROM docker.io/library/caddy:2.11.4@sha256:597f813aa60873d4c8148c816fbc4507d496ab160d620460279557f58ee3d0b9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
