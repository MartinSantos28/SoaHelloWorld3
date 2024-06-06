FROM node:14

# Crear el directorio .npm dentro del directorio de inicio del usuario node
RUN mkdir -p /home/node/.npm

# Cambiar los permisos del directorio .npm
RUN chown -R node:node /home/node/.npm

# Configurar npm para usar un directorio diferente para el almacenamiento en caché
ENV NPM_CONFIG_CACHE /home/node/.npm-global

# Crear un directorio para el almacenamiento en caché global de npm
RUN mkdir -p /home/node/.npm-global
RUN chown -R node:node /home/node/.npm-global

# Establecer la variable de entorno para el almacenamiento en caché global de npm
ENV PATH="/home/node/.npm-global/bin:${PATH}"

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo package.json e instalar las dependencias
COPY package*.json ./
RUN npm install

# Copiar el resto de los archivos
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Establecer el usuario node como el usuario por defecto
USER node

# Comando por defecto para iniciar la aplicación
CMD ["node", "index.js"]
