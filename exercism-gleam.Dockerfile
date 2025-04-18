#FROM bookworm:latest
FROM ghcr.io/gleam-lang/gleam:v1.10.0-erlang

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=xterm-256color

RUN apt-get update

# standard dev tools (local package manager)
RUN apt-get install -y \
bat \
curl \
fd-find \
fzf \
git \
ripgrep \
sd \
shellcheck \
shfmt \
zsh 


# lazygit from github
RUN curl -LO "https://github.com/jesseduffield/lazygit/releases/download/v0.49.0/lazygit_0.49.0_Linux_x86_64.tar.gz" \
&& tar -xf lazygit_0.49.0_Linux_x86_64.tar.gz \
&& install lazygit -D -t /usr/local/bin/

# # starship from github
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# # eza from github
RUN curl -L https://github.com/eza-community/eza/releases/latest/download/eza_aarch64-unknown-linux-gnu.tar.gz | tar -xz \
&& chmod +x eza \
&& chown root:root eza \
&& mv eza /usr/local/bin/eza

# # exercism from github
RUN curl -L https://github.com/exercism/cli/releases/download/v3.5.4/exercism-3.5.4-linux-arm64.tar.gz | tar -xz \
&& chmod +x exercism \
&& chown root:root exercism \
&& mv exercism /usr/local/bin/exercism

# # yazi from github, not installing completions
# RUN curl -LO https://github.com/sxyazi/yazi/releases/latest/download/yazi-aarch64-unknown-linux-gnu.zip \
# && unzip yazi-aarch64-unknown-linux-gnu.zip \
# && chmod +x yazi-aarch64-unknown-linux-gnu\yazi \
# && chown root:root yazi-aarch64-unknown-linux-gnu\yazi \
# && mv yazi-aarch64-unknown-linux-gnu\yazi /usr/local/bin/yazi
# && rm -rf yazi-aarch64-unknown-linux-gnu \
# && rm yazi-aarch64-unknown-linux-gnu.zip

# helix from github
RUN apt-get install -y xz-utils \
&& curl -LO https://github.com/helix-editor/helix/releases/latest/download/helix-25.01.1-aarch64-linux.tar.xz \
&& tar -xf helix-25.01.1-aarch64-linux.tar.xz \
&& chmod +x helix-25.01.1-aarch64-linux/hx \
&& chown root:root helix-25.01.1-aarch64-linux/hx \
&& mv helix-25.01.1-aarch64-linux/hx /usr/local/bin/hx \
&& rm -rf helix-25.01.1-aarch64-linux*

RUN apt-get clean

WORKDIR /workspace

CMD ["/bin/zsh"]
