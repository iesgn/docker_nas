# Usar una imagen base oficial de Apache
FROM httpd:latest

# Instalar los módulos necesarios para WebDAV
RUN apt-get update && apt-get install -y \
    apache2-utils \
    && a2enmod dav \
    && a2enmod dav_fs \
    && a2enmod auth_basic \
    && a2enmod rewrite \
    && a2enmod headers

# Crear directorios para WebDAV (estos serán sobrescritos por volúmenes)
RUN mkdir -p /var/www/documentroot1 /var/www/documentroot2 && \
    chmod -R 755 /var/www

# Copiar archivo de configuración personalizado de Apache
COPY webdav.conf /etc/apache2/sites-available/000-default.conf


# Exponer el puerto 80 para acceso HTTP
EXPOSE 80

# Comando para iniciar Apache en primer plano
CMD ["httpd-foreground"]
