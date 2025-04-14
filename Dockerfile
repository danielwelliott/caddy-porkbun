FROM caddy:0e570e0cc717f02cf3800ae741df70cd074c7275-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun@bdef00f022ad9c586a0cf44c46940a9d52ff2fa6

FROM caddy:0e570e0cc717f02cf3800ae741df70cd074c7275

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
