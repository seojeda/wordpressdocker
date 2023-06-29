# Imagen base
FROM wordpress:latest

# Copiar el archivo wp-config.php personalizado al contenedor
COPY wp-config.php /var/www/html/

# Establecer los permisos adecuados para el archivo wp-config.php
RUN chown www-data:www-data /var/www/html/wp-config.php
RUN chmod 640 /var/www/html/wp-config.php
