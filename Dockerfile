FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

# Create the .npm directory and fix the ownership
RUN mkdir -p /.npm && chown -R 995:991 "/.npm"

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

