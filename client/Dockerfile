#base image stage
FROM node:alpine as builder

#working directory
WORKDIR '/app'

#COPY package.json
COPY ./package.json ./

#npm install
RUN npm install

#Copy app
COPY . .

#build prod app
RUN ["npm", "run", "build"]

#start nginx image
FROM nginx
#expose port
EXPOSE 3000
#copy default.conf file
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#copy build app
COPY --from=builder /app/build /usr/share/nginx/html
