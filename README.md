# Ejercicio 3: Debian + Apache + PHP

## Objetivo

Construir, ejecutar y comprobar el funcionamiento de un contenedor Docker basado en Debian, en el que se instalen Apache y PHP, y se despliegue una pequeña web accesible tanto por HTTP como por HTTPS.

## Descripción

Este proyecto parte de una imagen base de Debian (sin nada instalado) para crear un contenedor que:

- Instala y configura **Apache** y **PHP**.
- Publica una web simple (por ejemplo, un `index.php` o `index.html`).
- Permite el acceso a la web mediante los protocolos HTTP y HTTPS.

> **Nota:** Se debe configurar Apache para que inicie en primer plano, lo que es necesario para que el contenedor se mantenga en ejecución (por ejemplo, usando `apachectl -D FOREGROUND`).

## Requisitos

- [Docker](https://www.docker.com/get-started) instalado en tu sistema.
- (Opcional) Git para clonar y gestionar el repositorio.

## Contenido del Proyecto

- **Dockerfile:** Define la imagen a partir de Debian, instala Apache y PHP, configura el servicio y copia los archivos de la web.
- **Archivos de la Web:** Al menos un archivo (por ejemplo, `index.php` o `index.html`) que contendrá el contenido de la web.
- (Opcional) **Configuración de SSL/HTTPS:** Si se desea habilitar HTTPS, se deben incluir los certificados (ya sean generados o autofirmados) y la configuración correspondiente en Apache.

## Instrucciones de Uso

### 1. Construir la Imagen Docker

Desde el directorio raíz del proyecto (donde se encuentra el `Dockerfile`), ejecuta el siguiente comando para construir la imagen:

```bash
docker build -t debian_apache_php .

