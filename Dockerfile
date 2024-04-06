#Archivo elaborado por: Fernando Enrique Alvarado Bolaños

#Usamos una imagen de NodeJS
FROM node:18-alpine
#Definimos el directorio de trabajo
WORKDIR /app
#Copiamos el package.json y package-lock.json en el directorio de trabajo
COPY /app/package*.json .
#Copiamos la carpeta spec al directorio de trabajo
COPY /app/spec .
#Copiamos la carpeta src al directorio de trabajo
COPY /app/src .
#Se ejecuta el comando npm run install para instalar las dependencias de la aplicación 
RUN npm install
#Copiamos los archivos de la aplicación en el contenedor
COPY app/. .
#Exponemos el puerto en donde se va a ejecutar la aplicación
EXPOSE 3000
#Comando de ejecución de la aplicación
CMD [ "node", "src/index.js" ]