FROM ubuntu:24.04

RUN <<EOF bash -e
apt-get update
apt-get -y install git
EOF

RUN --mount=type=secret,id=github_token,id=ntt \
   ls -laF /run/secrets && \
   cat /run/secrets/github_token
#ENTRYPOINT ["/bin/bash", "-c", "cat /run/secrets/"]
