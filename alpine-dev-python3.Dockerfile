FROM alpine-dev-base:latest

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apk update && apk add --no-cache python3 py3-pip 

WORKDIR /workspace

CMD ["/bin/bash"]
