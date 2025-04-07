# frontend/Dockerfile
FROM node:16

WORKDIR /app

# Copia archivos de dependencias para instalar
COPY package*.json ./
RUN npm install

# Copia el código de la aplicación
COPY . .

# Para Vite el puerto por defecto es 5173, pero verifica en tu configuración
EXPOSE 5173

# Comando para iniciar el servidor de desarrollo
CMD ["npm", "run", "dev"]
