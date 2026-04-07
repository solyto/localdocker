FROM node:22

WORKDIR /app

COPY ./app/ .

CMD ["npm", "run", "dev"]
