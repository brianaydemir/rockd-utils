FROM almalinux:9

# Reference: https://github.com/hadolint/hadolint/wiki/DL4006

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install essential packages and utilities.

USER root
WORKDIR /tmp
RUN true \
    && dnf update -y \
    && dnf install -y --allowerasing \
        ca-certificates \
        curl \
        openssh-clients \
        procps \
        unzip \
    && dnf clean all \
    && rm -rf /var/cache/dnf/* \
    && (curl https://rclone.org/install.sh | bash) \
    && true

# Configure container startup.

WORKDIR /
