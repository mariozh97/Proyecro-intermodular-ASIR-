# srv1 – Servicio Samba

## 1. Introducción

En este apartado se describe la instalación y configuración del servicio **Samba** en el servidor **srv1**, utilizado para compartir archivos en red con equipos cliente.

---

## 2. Instalación de Samba

Para instalar el servicio Samba se han utilizado los siguientes comandos:

`sudo apt update`  
`sudo apt install samba`

Una vez instalado, se ha comprobado que el servicio está activo:

`systemctl status smbd`  

Resultado: servicio activo (running)

---

## 3. Creación del directorio compartido

Se ha creado un directorio destinado a ser compartido en red:

`sudo mkdir /srv/samba/compartido`

Se han asignado los permisos necesarios:

`sudo chown alumno:alumno /srv/samba/compartido`  
`sudo chmod 770 /srv/samba/compartido`

---

## 4. Configuración del recurso compartido

Se ha editado el archivo de configuración de Samba:

`sudo nano /etc/samba/smb.conf`

La configuración se ha añadido en la sección de recursos compartidos del archivo smb.conf.

Se ha añadido el siguiente recurso compartido:

[Compartido]  
path = /srv/samba/compartido  
valid users = alumno  
read only = no  
browsable = yes  
create mask = 0770  
directory mask = 0770  

Se ha comprobado la sintaxis de la configuración:

`testparm`

---

## 5. Reinicio del servicio

Para aplicar los cambios realizados se ha reiniciado el servicio Samba:

`sudo systemctl restart smbd`

---

## 6. Verificación del servicio

Se ha comprobado que el servicio está funcionando correctamente:

`systemctl status smbd`  

Resultado: servicio activo (running)

También se ha verificado el acceso desde un cliente utilizando las credenciales del usuario configurado.

<p align="center">
<img src="../capturas/srv1/acceso_windows.png" width="650">
</p>

---

## 7. Estado final

Tras la configuración realizada:

- Servicio Samba instalado y operativo  
- Recurso compartido configurado correctamente  
- Usuario con permisos de acceso configurado  
- Acceso desde cliente verificado  

El servidor queda preparado para compartir archivos dentro de la red.
