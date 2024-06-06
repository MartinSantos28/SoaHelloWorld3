FROM node:14

WORKDIR /app

# Copiar el package.json primero para aprovechar el caché de las capas de Docker
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto de los archivos de la aplicación
COPY . .

# Exponer el puerto que utilizará tu aplicación
EXPOSE 3000

# Comando para limpiar y reiniciar el contenedor al iniciarlo
CMD ["bash", "-c", "docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && node index.js"]
