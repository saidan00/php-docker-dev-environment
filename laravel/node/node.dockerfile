FROM node:15.9.0-alpine3.10

#Install some dependencies
WORKDIR /usr/app

# Set up a default command
CMD [ "npm","start" ]