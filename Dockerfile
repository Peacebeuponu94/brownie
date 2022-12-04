FROM python:3.7@sha256:cb158b66aaaf68b642eea2246a9a4dcc6bc39bc634dccd43812ae44807c70765

# Set up code directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install linux dependencies
RUN apt-get update \
 && apt-get install -y libssl-dev npm

RUN npm install n -g \
 && npm install -g npm@latest
RUN npm install -g ganache

COPY requirements.txt .
COPY requirements-dev.txt .

RUN pip install -r requirements.txt
RUN pip install -r requirements-dev.txt

WORKDIR /code
