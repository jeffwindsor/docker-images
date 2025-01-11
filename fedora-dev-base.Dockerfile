FROM fedora:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN dnf update -y \
&& dnf install -y helix git fzf ripgrep \
&& dnf copr enable -y atim/lazygit \
&& dnf install -y lazygit \
&& dnf copr enable -y atim/starship \
&& dnf install -y starship

WORKDIR /workspace

CMD ["/bin/bash"]
