#base image
FROM node:alpine

#working directory
WORKDIR '/app'

#COPY package.json
COPY ./package.json ./

#npm install
RUN npm install

#Copy app
COPY . .

#image command
CMD ["npm", "run", "start"]