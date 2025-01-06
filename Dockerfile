FROM node:lts

ARG NODE_API_PORT

ARG NODE_API_PORT=${NODE_API_PORT}

WORKDIR /app

COPY . .

RUN apt update && apt install curl -y && npm i nodemon -g && npm i npm@latest -g

RUN npm install

EXPOSE ${NODE_API_PORT}

CMD [ "nodemon", "index.js" ]