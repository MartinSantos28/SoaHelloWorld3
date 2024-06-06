FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

# Fix the ownership of the .npm directory
RUN chown -R 995:991 "/.npm"

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
