FROM node:22

WORKDIR /app

COPY ./app/ .

RUN npm ci

CMD ["npm", "run", "dev"]
