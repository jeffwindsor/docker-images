FROM fedora-dev-base:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN dnf update -y \
&& dnf install -y python3 python3-lsp-server+all black

WORKDIR /workspace

CMD ["/bin/bash"]
