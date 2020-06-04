### STAGE 1: Build ###
FROM node:12.7-alpine AS builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY --from=builder /usr/src/app/dist/sample-ng-app /usr/share/nginx/html