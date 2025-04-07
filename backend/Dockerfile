# backend/Dockerfile
FROM node:22

WORKDIR /app

# Copia solo package.json y package-lock.json para aprovechar la caché de Docker
COPY package*.json ./
RUN npm install

# Copia el resto del código
COPY . .

# Expone el puerto en el que se ejecuta la API (por ejemplo, 3001)
EXPOSE 3001

# Comando para iniciar la aplicación (ajusta según tu script)
CMD ["npm", "start"]
