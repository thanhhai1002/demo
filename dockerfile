FROM node:16-alpine

USER node

WORKDIR /app/test

COPY --chown=node:node ./package.json .

RUN npm install

COPY --chown=node:node . .

CMD ["npm", "start"]

# FROM node:alpine as builder

# USER node

# WORKDIR /app/test

# COPY --chown=node:node ./package.json .

# RUN npm install

# COPY --chown=node:node . .
# RUN npm run build 

# FROM nginx

# COPY --from=builder app/test/dist/source-demo /usr/share/nginx/html