FROM nginx:alpine

# Instala los módulos de WebDAV (nginx-mod-http-dav-ext)
RUN apk update && \
    apk add --no-cache nginx-mod-http-dav-ext nginx-extras

# Copiar configuración personalizada de nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Crear directorios para WebDAV en el contenedor (serán sobrescritos por los volúmenes)
RUN mkdir -p /var/www/documentroot1 /var/www/documentroot2 && \
    chmod -R 755 /var/www

# Exponer el puerto 80 para acceso HTTP
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]

