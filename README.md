# Data tools

Docker container with built-in tools for data engineering / analytics work.

I created this to have a way to quickly setup environment for different projects, but didn't want to deal with virtual environments and installing packages each time. With this I can create throwaway containers that have all the tools that I need.

## Usage

1. Build Docker image

```sh
make build
```

2. Run it

```sh
make <ipy | lab | retro>
```

Where the option is one of the following:

* `ipy` Runs IPython console
* `lab` Runs Jupyter Lab for full development experience
* `retro` Runs more minimalist version modeled after classical Jupyter Notebook
