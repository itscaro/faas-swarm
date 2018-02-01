TAG?=latest

build:
	docker build \
		--build-arg http_proxy="${http_proxy}" \
		--build-arg https_proxy="${https_proxy}" \
		-t functions/faas-swarm:$(TAG) .

push:
	docker push functions/faas-swarm:$(TAG)

travis-push:
	docker tag functions/faas-swarm:latest-dev functions/faas-swarm:${TRAVIS_TAG};
	docker login -u=${DOCKER_USERNAME} -p=${DOCKER_PASSWORD};
	docker push functions/faas-swarm:${TRAVIS_TAG};

all: build
