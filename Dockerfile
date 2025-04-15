FROM caddy:v2.9.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun@v0.2.1

FROM caddy:v2.9.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
