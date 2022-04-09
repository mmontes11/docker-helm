FROM alpine/helm:3.8.1

RUN apk update && apk add bash make

RUN helm plugin install https://github.com/chartmuseum/helm-push.git --version=v0.10.2