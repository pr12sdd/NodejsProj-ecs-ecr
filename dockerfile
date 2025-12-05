FROM node:20-alpine

WORKDIR /apps

COPY package**.json ./

RUN npm ci

COPY . .

EXPOSE 8000

CMD ["node" ,"app.js"]
