FROM ubuntu:24.04

RUN <<EOF bash -e
apt-get update
apt-get -y install git

EOF

ENTRYPOINT ["/bin/bash", "-c", "cat /run/secrets/"]
