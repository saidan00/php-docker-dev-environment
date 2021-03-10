FROM node:10-alpine

#Install some dependencies
WORKDIR /usr/app

# Set up a default command
CMD [ "npm","start" ]
