FROM debian:stable
LABEL author="Jan Opitz <jan.opitz@tyclipso.net>"

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]
RUN apt-get update; \
    apt-get install -y --no-install-recommends -o DPkg::Options::="--force-confdef" \
        curl=* \
        jq=* \
        vault=*