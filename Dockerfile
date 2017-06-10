# Use Docker image fore NodeJS LTS
FROM node:6:11:0

# A security best practice is to run the app from an unprivileged user.
# We do not want to run the app as the root user.
# https://en.wikipedia.org/wiki/Principle_of_least_privilege

# Chain two shell commands together in a single RUN command. This reduces the
# number of layers in the resulting image.
RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.10:10

ENV HOME=/home/app

USER app

WORKDIR $HOME/chat