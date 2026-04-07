FROM node:22

WORKDIR /app

COPY ./landing-page/ .

RUN rm -f package-lock.json
RUN rm -rf node_modules/

RUN npm install --include=dev

CMD ["npm", "run", "dev"]
