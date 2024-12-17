# Usar la imagen oficial de Apache basada en Debian
FROM httpd:latest

# Instalar utilidades necesarias y módulos WebDAV
RUN apt-get update && apt-get install -y \
    apache2-utils \
    && apt-get install -y \
    libapache2-mod-dav \
    libapache2-mod-dav-fs \
    && echo "LoadModule dav_module /usr/lib/apache2/modules/mod_dav.so" >> /etc/apache2/apache2.conf \
    && echo "LoadModule dav_fs_module /usr/lib/apache2/modules/mod_dav_fs.so" >> /etc/apache2/apache2.conf \
    && echo "LoadModule auth_basic_module /usr/lib/apache2/modules/mod_auth_basic.so" >> /etc/apache2/apache2.conf \
    && echo "LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so" >> /etc/apache2/apache2.conf \
    && echo "LoadModule headers_module /usr/lib/apache2/modules/mod_headers.so" >> /etc/apache2/apache2.conf

# Crear directorios para WebDAV
RUN mkdir -p /var/www/documentroot1 /var/www/documentroot2 && \
    chmod -R 755 /var/www

# Copiar archivo de configuración de WebDAV
COPY webdav.conf /etc/apache2/sites-available/000-default.conf


# Exponer el puerto 80 para acceso HTTP
EXPOSE 80

# Comando para ejecutar Apache en primer plano
CMD ["httpd-foreground"]
