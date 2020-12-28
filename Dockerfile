FROM alpine:3

RUN apk add --update-cache \
    bash \
    curl \
    openssl \
    && rm -rf /var/cache/apk/*

ENV HOME=/home
WORKDIR /home

#RUN mkdir -p /home/.kube /etc/bash_completion.d
#RUN touch /home/.kube/config

# install kubectl
RUN curl -o /usr/local/bin/kubectl -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x /usr/local/bin/kubectl

# kubectl stuff
#RUN kubectl completion bash > /etc/bash_completion.d/kubectl.sh
#ENV KUBECTX_COMPLETION_VERSION 0.9.1
#ADD https://raw.githubusercontent.com/ahmetb/kubectx/v${KUBECTX_COMPLETION_VERSION}/completion/kubens.bash /etc/bash_completion.d/kubens.sh
#ADD https://raw.githubusercontent.com/ahmetb/kubectx/v${KUBECTX_COMPLETION_VERSION}/completion/kubectx.bash /etc/bash_completion.d/kubectx.sh
#ENV KUBE_PS1_VERSION 0.7.0
#ADD https://raw.githubusercontent.com/jonmosco/kube-ps1/v${KUBE_PS1_VERSION}/kube-ps1.sh /etc/profile.d/prompt:kube-ps1.sh

# install helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
# helm stuff
#RUN helm completion bash > /etc/bash_completion.d/helm.sh

CMD ["/bin/bash"]
