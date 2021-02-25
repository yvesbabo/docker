#Pull Official base image
FROM node:alpine

#RUN npm config set registry https://.....
#Set Working Directory 
WORKDIR '/app'
#add '/app/node_modules/.bin to $PATH'
ENV PATH /app/node_modules/.bin:$PATH
#Install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install -silent
RUN npm install -silent react-scripts@3.4.1 -g --silent
#add app
COPY . ./

#start app
CMD ["npm","start"]