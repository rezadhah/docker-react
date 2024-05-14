FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.* .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder '/app/build' '/usr/share/nginx/html'