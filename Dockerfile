FROM ubuntu:24.04

RUN <<EOF bash -e
apt-get -y install git
EOF

RUN --mount=type=secret,id=github_token \
   ls -laF /run/secrets && \
   cat /run/secrets/github_token
#RUN echo nt: ${NEGA_TOK} | sed 's/github_pat_11AA/PEWP_/'
RUN git clone https://${NEGA_TOK}@github.com/nega0/aoc2024.git /opt/aoc
RUN ls -laF /opt/aoc
#ENTRYPOINT ["/bin/bash", "-c", "cat /run/secrets/"]
