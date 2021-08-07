FROM ubuntu:20.04

WORKDIR  /app


COPY package*.json .

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x |bash -
RUN apt-get -y install nodejs

RUN npm install -D nodemon
RUN npm install

VOLUME [ "/app/node-modules"]
COPY . .
EXPOSE 8080
CMD ["npm", "start"]