FROM ubuntu:20.04

# Instalar Node.js
RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g n
RUN n stable

# Instalar sudo
RUN apt-get update && apt-get install -y sudo

# Crear un usuario no privilegiado y asignar permisos
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
RUN chown -R appuser:appgroup /.npm

# Cambiar al usuario no privilegiado
USER appuser

# Copiar y ejecutar tu aplicación
WORKDIR /app
COPY . .
CMD ["node", "index.js"]
