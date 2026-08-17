FROM fedora:latest
RUN dnf update -y && dnf install -y fish python3 gcc
CMD ["/usr/bin/fish"]
