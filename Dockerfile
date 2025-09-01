FROM debian:stable-slim
LABEL author="Jan Opitz <jan.opitz@tyclipso.net>"

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt-get update; \
    apt-get install -y --no-install-recommends -o DPkg::Options::="--force-confdef" \
    ca-certificates=* \
    curl=* \
    gpg=* \
    jq=* \
    lsb-release=*; \
    rm -rf /var/lib/apt/lists/*;

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg; \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends vault=*; \
    rm -rf /var/lib/apt/lists/*;