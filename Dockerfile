FROM node:14

# Create app directory and change to it
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Add a non-root user and use that user
RUN useradd -ms /bin/bash appuser
USER appuser

# Expose the port
EXPOSE 3000

# Command to run the app
CMD ["node", "index.js"]
