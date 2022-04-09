FROM alpine/helm:3.7.2

RUN apk add --update bash make

RUN helm plugin install https://github.com/chartmuseum/helm-push.git --version=v0.10.2