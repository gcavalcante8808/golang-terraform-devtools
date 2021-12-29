FROM busybox as downloader
ARG TERRAFORM_VERSION=1.1.2
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
ARG TERRAGRUNT_VERSION=v0.35.16
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 terragrunt && \
    chmod +x terragrunt

FROM golang:1.17
LABEL maintainer="gcavalcante8808"

COPY --from=downloader /terraform /usr/local/bin/terraform
COPY --from=downloader /terragrunt /usr/local/bin/terragrunt

