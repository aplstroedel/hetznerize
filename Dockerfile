FROM node:lts

WORKDIR /app

COPY . .

RUN apt update && apt install curl -y && npm i npm@latest -g

RUN npm install

EXPOSE 7001

CMD [ "node", "index.js" ]