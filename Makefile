all:
	docker build -t jupyter-work \
		--build-arg USER_ID=$(shell id -u ${USER}) \
		--build-arg GROUP_ID=$(shell id -g ${USER}) \
		-f ./Dockerfile .
run:
	docker run --gpus all --name jupyter-work -v $(shell pwd):/home/sci-user/notebooks -p 127.0.0.1:8888:8888 -d jupyter-work
