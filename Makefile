SHELL:=/bin/bash

build:
	docker build --no-cache --tag data .

ipy:
	docker run -it --rm data ipython

lab:
	docker run -it --rm --publish 8888:8888 data jupyter lab --no-browser --ip="0.0.0.0"

retro:
	docker run -it --rm --publish 8888:8888 data jupyter retro --no-browser --ip="0.0.0.0"
