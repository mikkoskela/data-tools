SHELL:=/bin/bash

build:
	docker build --no-cache --tag data-tools .

ipy:
	docker run -it --rm ghcr.io/mikkoskela/data-tools ipython

lab:
	docker run -it --rm --publish 8888:8888 ghcr.io/mikkoskela/data-tools jupyter lab --no-browser --ip="0.0.0.0"

retro:
	docker run -it --rm --publish 8888:8888 ghcr.io/mikkoskela/data-tools jupyter retro --no-browser --ip="0.0.0.0"

login:
	echo ${CR_PAT} | docker login ghcr.io -u ${GH_USERNAME} --password-stdin

tag:
	docker tag data-tools:latest ghcr.io/mikkoskela/data-tools:latest

push:
	docker push ghcr.io/mikkoskela/data-tools

release: build tag login push
