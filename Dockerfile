FROM node:11

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json ./
COPY yarn.lock ./

USER node

RUN yarn

COPY --chown=node:node . .

EXPOSE 8080

CMD ["yarn", "start"]
