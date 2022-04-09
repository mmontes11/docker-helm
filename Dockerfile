FROM alpine:3.15.4

ENV BASE_URL="https://get.helm.sh"
ENV VERSION="3.8.1"

RUN case `uname -m` in \
  x86_64) ARCH=amd64; ;; \
  armv7l) ARCH=arm; ;; \
  aarch64) ARCH=arm64; ;; \
  *) echo "un-supported arch, exit ..."; exit 1; ;; \
  esac && \
  apk add --update --no-cache wget git && \
  wget ${BASE_URL}/helm-v${VERSION}-linux-${ARCH}.tar.gz -O - | tar -xz && \
  mv linux-${ARCH}/helm /usr/bin/helm && \
  chmod +x /usr/bin/helm && \
  rm -rf linux-${ARCH}

# TODO: pin version. See: https://github.com/chartmuseum/helm-push/issues/134
RUN helm plugin install https://github.com/chartmuseum/helm-push.git