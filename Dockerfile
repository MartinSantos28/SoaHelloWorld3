FROM node:14

WORKDIR /app

COPY package*.json ./
RUN chown -R 995:991 "/.npm"
RUN npm install

COPY . .

EXPOSE 3000

USER node

CMD ["node", "index.js"]
