

FROM node:alpine as builder


WORKDIR '/app/test'

COPY  ./package.json .

RUN npm install

COPY  . .


RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder app/test/dist/source-demo /usr/share/nginx/html