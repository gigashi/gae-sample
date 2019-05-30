DOCKER_CMD ?= 

.PHONY: all show-make-commands init-docker run-docker run-local-test run-gcloud

# commands

all:
	@echo all

init-docker: docker/build.log

run-docker: init-docker
	docker run -ti --rm \
	-w /work \
	-v `pwd`/src:/work:rw \
	-v `pwd`/gcloud-config:/root/.config/gcloud:rw \
	-p 8080:8080 \
	-p 8000:8000 \
	gcloudgolang ${DOCKER_CMD}	

run-local-test: init-docker
	@echo "-------------------------------"
	@echo "app     = http://127.0.0.1:8080"
	@echo "console = http://127.0.0.1:8000"
	@echo "-------------------------------"

	@docker-compose up || :

run-gcloud: init-docker
	@DOCKER_CMD="gcloud alpha interactive" $(MAKE) run-docker	

# files

docker/build.log: docker/Dockerfile
	docker build ./docker -t gcloudgolang > docker/build.log
