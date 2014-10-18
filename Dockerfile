# DOCKER-VERSION 1.0.1
FROM node:0.10.31
EXPOSE 8080

# Bundle app source
COPY app /app
WORKDIR /app

# RUN npm install
CMD node server.js
