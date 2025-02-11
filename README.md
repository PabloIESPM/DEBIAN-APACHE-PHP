# Ejercicio 3: DEBIAN + APACHE + PHP

Este proyecto tiene como objetivo construir, ejecutar y comprobar el funcionamiento de un contenedor Docker basado en **Debian**, en el que se instalará y configurará **Apache** y **PHP**. Además, se publicará una pequeña web accesible mediante HTTP y HTTPS.

## Estructura del proyecto

El repositorio contiene los siguientes elementos:

- **Dockerfile**  
  Instrucciones para construir la imagen Docker a partir de la imagen base de Debian. En este archivo se realizan las siguientes tareas:
  - Actualización de repositorios.
  - Instalación de Apache, PHP, dos editores de texto (por ejemplo, `vim` y `nano`) y `net-tools` (para disponer del comando `ifconfig`).
  - Copia de los archivos de la web (HTML y PHP) al directorio de Apache.
  - Configuración del VirtualHost para servir la web por HTTP y HTTPS.
  - Copia de los certificados SSL (generados previamente) desde el directorio `certs/` al contenedor.
  - Configuración para que Apache se inicie en primer plano (por ejemplo, utilizando `apachectl -D FOREGROUND`).

- **www/**  
  Directorio que contiene el contenido de la web:
  - `index.html`: Página principal en HTML.
  - `phpinfo.php`: Página que muestra la información de PHP.

- **config/** *(opcional)*  
  Archivos de configuración adicionales para Apache, como el VirtualHost que habilita el acceso a través de HTTP y HTTPS.

- **certs/**  
  Directorio donde se almacenan los certificados SSL (`server.crt` y `server.key`) que se han generado fuera del contenedor y se copiarán durante la construcción de la imagen.

- **README.md**  
  Este archivo, que explica en detalle cómo construir, ejecutar y probar el contenedor.

## Requisitos previos

- **Docker:**  
  Asegúrate de tener Docker instalado en tu sistema. Puedes descargarlo e instalarlo desde [Docker Get Started](https://www.docker.com/get-started).

- **Certificados SSL:**  
  Genera los certificados SSL (por ejemplo, usando OpenSSL) y colócalos en el directorio `certs/` antes de construir la imagen. Un ejemplo de comando para generar un certificado autofirmado es:

  ```bash
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout certs/server.key -out certs/server.crt
