FROM ubuntu:24.04

RUN <<EOF bash -e
apt-get update
apt-get -y install git
EOF

RUN --mount=type=secret,id=github_token \
   ls -laF /run/secrets && \
   git clone https://$(cat /run/secrets/github_token)@github.com/nega0/aoc2024.git /opt/aoc2024
RUN env|sort
RUN echo nt: ${NEGA_TOK}
RUN git clone https://${NEGA_TOK}@github.com/nega0/aoc2024.git /opt/aoc
RUN ls -laF /opt/aoc
#ENTRYPOINT ["/bin/bash", "-c", "cat /run/secrets/"]
