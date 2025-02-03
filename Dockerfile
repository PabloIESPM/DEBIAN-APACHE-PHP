# Usar la imagen base de Debian
FROM debian:latest

# Actualizar la lista de paquetes e instalar Apache, PHP y otros paquetes necesarios
RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    ssl-cert && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Habilitar módulos de Apache (SSL para HTTPS)
RUN a2enmod ssl && \
    a2ensite default-ssl

# Copiar los archivos de la web al directorio de Apache
COPY src/ /var/www/html/

# Exponer los puertos 80 (HTTP) y 443 (HTTPS)
EXPOSE 80
EXPOSE 443

# Comando para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
