# Usa la imagen base de Node.js 14
FROM node:14

# Crea un usuario no root y establece el directorio de trabajo
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
WORKDIR /app

# Cambia el propietario del directorio de la aplicación
RUN chown -R appuser:appgroup /app

# Cambia al usuario no root
USER appuser

# Copia los archivos de la aplicación al directorio de trabajo
COPY package*.json ./
COPY . .

# Instala las dependencias de la aplicación
RUN npm install

# Expone el puerto en el que se ejecuta la aplicación
EXPOSE 3000

# Define el comando de inicio de la aplicación
CMD ["node", "index.js"]
