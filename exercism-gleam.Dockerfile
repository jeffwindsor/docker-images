#FROM alpine:latest
FROM ghcr.io/gleam-lang/gleam:nightly-erlang-alpine

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apk update \
 && apk add --no-cache \
        zsh bash shellcheck shfmt starship \
        build-base curl \
        git openssh lazygit \
        tree-sitter helix \
        ripgrep fd sd
        
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
     exercism

WORKDIR /workspace

CMD ["/bin/zsh"]
