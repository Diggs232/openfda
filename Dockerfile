FROM python:3.13.0
RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh | bash -
RUN apt-get install -y nodejs netcat-traditional p7zip-full
WORKDIR /usr/src/openfda
ADD . ./
RUN rm -rf .eggs _python-env openfda.egg-info logs
RUN ./bootstrap.sh
CMD ["./scripts/all-pipelines-docker.sh"]
