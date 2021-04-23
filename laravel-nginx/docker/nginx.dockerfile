FROM nginx:1.16-alpine

RUN apk --update --no-cache add certbot certbot-nginx