FROM node:lts

WORKDIR /app

COPY . .

RUN apt update && apt install curl -y

RUN npm install

EXPOSE 7000

CMD [ "node", "index.js" ]