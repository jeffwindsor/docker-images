FROM alpine:latest

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN echo 'eval "$(starship init bash)"' >> /root/.bashrc \
    && apk update \
    && apk add --no-cache \
        bash shellcheck shfmt starship \
        build-base curl \
        git openssh lazygit \
        tree-sitter helix \
        ripgrep fd sd

WORKDIR /workspace

CMD ["/bin/bash"]
