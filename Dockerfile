FROM nginx:latest
RUN apt-get update && \
    apt-get install -y \
    nginx-extras \
    && rm -rf /var/lib/apt/lists/*

# Copiar configuración personalizada de nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Crear directorios para WebDAV en el contenedor (serán sobrescritos por los volúmenes)
RUN mkdir -p /var/www/documentroot1 /var/www/documentroot2 && \
    chmod -R 755 /var/www && \
    chown -R www-data:www-data /var/www
