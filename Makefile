all:
	docker build -t jupyter-work \
		--build-arg USER_ID=$(shell id -u ${USER}) \
		--build-arg GROUP_ID=$(shell id -g ${USER}) \
		-f ./Dockerfile .
run:
	docker run --name jupyter-work -v $(shell pwd):/home/sci-user/notebooks -p 10.20.30.2:8890:8888 -d jupyter-work
