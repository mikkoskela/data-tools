FROM python:3.10.1-slim-bullseye

RUN groupadd --gid 1000 analyst && \
    useradd --create-home --gid 1000 --uid 1000 analyst

USER analyst
ENV PATH="$PATH:/home/analyst/.local/bin"
WORKDIR /home/analyst

RUN mkdir notebooks

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --user -r requirements.txt

# For Jupyter
EXPOSE 8888

CMD bash
