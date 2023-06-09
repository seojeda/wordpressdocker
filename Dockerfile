# Utilizar una imagen base de WordPress
FROM wordpress:latest

# Instalar extensiones y herramientas adicionales
RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libpng-dev \
        libjpeg-dev \
        libxml2-dev \
        libzip-dev \
        zip \
        unzip \
    && docker-php-ext-install -j$(nproc) \
        gd \
        bcmath \
        soap \
        zip \
        mysqli

# Copiar el archivo de configuración personalizado
COPY wp-config.php /var/www/html/wp-config.php

# Establecer los permisos adecuados
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Variables de entorno para la configuración de MySQL
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=password

# Instalar el cliente MySQL
RUN apt-get update && apt-get install -y \
        default-mysql-client

# Comando de inicio para iniciar tanto el servidor MySQL como Apache
CMD ["sh", "-c", "service mysql start && apache2-foreground"]

