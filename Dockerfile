FROM alpine:3

RUN apk add --update-cache \
    bash \
    curl \
    openssl \
    && rm -rf /var/cache/apk/*

ENV HOME=/home
WORKDIR /home

# install kubectl
RUN curl -o /usr/local/bin/kubectl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x /usr/local/bin/kubectl

# install helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

COPY github_latest_release.sh /usr/local/bin/github_latest_release

CMD ["/bin/bash"]
