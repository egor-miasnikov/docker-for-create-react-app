#
# frontend docker file
# 

FROM node:7-alpine

RUN mkdir -p /usr/src/app
WORKDIR /app

RUN yarn global add react-scripts

COPY package.json /app/package.json
RUN yarn install
RUN mv /app/node_modules /node_modules

COPY . /app

CMD ["yarn", "start"]