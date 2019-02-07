PROJECT_NAME := kubectl
PROJECT_VERSION ?= 1.9.10 1.10.12 1.11.7 1.12.5 1.13.3
DOCKER_REGISTRY ?= docker.io/aporeto
DOCKER_IMAGE_NAME?=$(PROJECT_NAME)

$(PROJECT_VERSION):
	cd docker \
		&& docker build --build-arg KUBECTL_VERSION=$@ \
			-t $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):$(shell echo "$@" | cut -d. -f1-2) \
			-t $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):v$@ \
			. \
		&& docker push $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):$(shell echo "$@" | cut -d. -f1-2) \
		&& docker push $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):v$@

containers: $(PROJECT_VERSION)
