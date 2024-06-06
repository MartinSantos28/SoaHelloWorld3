FROM node:14

RUN mkdir -p /home/node/.npm && chown -R node:node /home/node/.npm

WORKDIR /app

COPY package*.json ./
RUN chown -R 995:991 "/.npm"
RUN npm install

COPY . .

EXPOSE 3000

USER node

CMD ["node", "index.js"]
