# FROM node:16-alpine

# RUN apk add --no-cache chromium
# ENV CHROME_BIN=/usr/bin/chromium-browser
# USER node
# WORKDIR /app/test

# COPY --chown=node:node ./package.json .

# RUN npm install

# COPY --chown=node:node . .

# CMD ["npm", "start"]

FROM node:alpine as builder

USER node

WORKDIR /app/test

COPY --chown=node:node ./package.json .

RUN npm install

COPY --chown=node:node . .

# RUN npm run test-by-docker

RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder /app/test/dist/source-demo /usr/share/nginx/html