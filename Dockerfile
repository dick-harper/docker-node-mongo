# Use Docker image fore NodeJS LTS
FROM node:6.11.0

# A security best practice is to run the app from an unprivileged user.
# We do not want to run the app as the root user.
# https://en.wikipedia.org/wiki/Principle_of_least_privilege

# Chain two shell commands together in a single RUN command. This reduces the
# number of layers in the resulting image.
RUN useradd --user-group --create-home --shell /bin/false app 

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/chat/
RUN chown -R app:app $HOME/*

USER app

WORKDIR $HOME/chat

RUN npm install && npm cache clean

CMD ["node", "index.js"]

