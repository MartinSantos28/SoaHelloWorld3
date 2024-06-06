FROM node:14

# Cambiar permisos en la carpeta .npm
RUN sudo chown -R 995:991 "/.npm"

RUN groupadd -r appgroup && useradd -r -g appgroup appuser
WORKDIR /app

COPY package*.json ./
RUN npm install --unsafe-perm=true --allow-root

COPY . .

USER appuser
CMD ["node", "index.js"]
