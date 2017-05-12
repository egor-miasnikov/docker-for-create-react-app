#
# frontend docker file
# 

#
#  Getting image from docker-hub
#
FROM node:7-alpine

#
# Work dir creation and initialization
#
RUN mkdir -p /usr/src/app
WORKDIR /app

#
# Install global dependencies
#
RUN yarn global add react-scripts

#
# Copy package.json from the host machine inside the container
#
COPY package.json /app/package.json

#
# Install local dependencies
#
RUN yarn install

#
# Move node_module folder from container to outside
#
RUN mv /app/node_modules /node_modules

#
# Copy all application folder from host machine to the container
#
COPY . /app

CMD ["yarn", "start"]