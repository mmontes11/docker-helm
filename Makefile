DOCKER_IMAGE_NAME:=mmontes11/helm
PLATFORM:="linux/amd64,linux/arm64,linux/arm"

.PHONY: build
build:
	docker buildx build \
	--platform=$(PLATFORM) \
	-t $(DOCKER_IMAGE_NAME) \
	.