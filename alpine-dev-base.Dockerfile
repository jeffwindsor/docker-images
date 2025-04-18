FROM alpine:latest

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=xterm-256color

RUN apk update \
 && apk add --no-cache \
        zsh bash shellcheck shfmt starship \
        build-base curl \
        git openssh lazygit \
        tree-sitter helix \
        ripgrep fd sd eza bat fzf
        
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
     exercism yazi

WORKDIR /workspace

CMD ["/bin/zsh"]
