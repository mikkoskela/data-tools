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


## Releasing

`data-tools` image is hosted in Github Container Registry.

The image can be updated manually or by a workflow.

### Manual update

1. Set required environment variables

```sh
export GH_USERNAME="<CHANGEME>"
export CR_PAT="<CHANGEME>"
```

2. Run release target

```sh
make release
```

### Automatic update

The image is also updated automatically by Github Actions workflow `.github/workflows/ghcr.yml`.

This workflow runs automatically on changes to the `main` branch and activity on pull requests.


## Setting aliases

To remove the need for manual building, the following aliases can be used to automatically use the latest image.

```sh
cat >> ~/.zshrc <<END

# data-tools aliases
alias ipy="docker run -it --rm ghcr.io/mikkoskela/data-tools:main ipython"
alias lab="docker run -it --rm --publish 8888:8888 ghcr.io/mikkoskela/data-tools:main jupyter lab --no-browser --ip='0.0.0.0'"
alias retro="docker run -it --rm --publish 8888:8888 ghcr.io/mikkoskela/data-tools:main jupyter retro --no-browser --ip='0.0.0.0'"

END
```
