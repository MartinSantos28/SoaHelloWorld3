FROM node:14

# Crear el directorio .npm dentro del directorio de inicio del usuario node
RUN mkdir -p /home/node/.npm

# Cambiar los permisos del directorio .npm
RUN chown -R node:node /home/node/.npm

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

USER node

CMD ["node", "index.js"]
