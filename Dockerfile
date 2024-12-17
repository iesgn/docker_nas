FROM debian:12

RUN apt-get update && \
    apt-get install -y \
    nginx \
    nginx-extras \
    libnginx-mod-http-dav-ext \
    && rm -rf /var/lib/apt/lists/*

# Copiar configuración personalizada de nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Crear directorios para WebDAV en el contenedor (serán sobrescritos por los volúmenes)
RUN mkdir -p /var/www/documentroot1 /var/www/documentroot2 && \
    chmod -R 755 /var/www

# Exponer el puerto 80 para acceso HTTP
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]

