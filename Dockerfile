FROM ubuntu:24.04

RUN <<EOF
apt-get update
apt-get -y install git
EOF

# RUN --mount=type=secret,id=GIT_AUTH_TOKEN \
#    ls -laF /run/secrets && \
#    GIT_AUTH_TOKEN=$(cat /run/secrets/GIT_AUTH_TOKEN) && \
#    git config --global "url.https://${GIT_AUTH_TOKEN}@github.com.insteadof" "https://github.com" && \
#    git clone https://github.com/nega0/aoc2024.git /opt/aoc2024 && \
#    ls -laF /opt/aoc2024

RUN --mount=type=secret,id=GIT_AUTH_TOKEN <<EOF
   ls -laF /run/secrets
   GIT_AUTH_TOKEN=$(cat /run/secrets/GIT_AUTH_TOKEN)
   git config --global "url.https://${GIT_AUTH_TOKEN}@github.com.insteadof" "https://github.com"
   git clone https://github.com/nega0/aoc2024.git /opt/aoc2024
   ls -laF /opt/aoc2024
EOF

# RUN echo nt: ${NEGA_TOK}
# RUN git clone https://${NEGA_TOK}@github.com/nega0/aoc2024.git /opt/aoc
# RUN ls -laF /opt/aoc
#ENTRYPOINT ["/bin/bash", "-c", "cat /run/secrets/"]
