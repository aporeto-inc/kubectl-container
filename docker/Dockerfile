FROM alpine:3.9

ARG KUBECTL_VERSION

RUN addgroup -g 1001 k8s && adduser -u 1001 -H -D -G k8s kubectl

RUN apk add --update ca-certificates curl \
    && rm /var/cache/apk/*

RUN curl -sSL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

USER kubectl:k8s

WORKDIR /tmp

ENTRYPOINT ["kubectl"]

CMD ["help"]
