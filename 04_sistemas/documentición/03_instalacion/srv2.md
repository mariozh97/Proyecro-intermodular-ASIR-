# srv2 – Instalación del servidor

## 1. Introducción

Se ha desplegado una máquina virtual denominada **srv2** utilizando Ubuntu Server 24.04 LTS en VirtualBox.

El objetivo es disponer de un segundo servidor dentro de la red para la implementación de servicios.

---

## 2. Parámetros de instalación

Durante el proceso de instalación se han configurado los siguientes valores:

- **Nombre del sistema:** srv2  
- **Usuario principal:** usuario  
- **Instalación de OpenSSH:** habilitada  
- **Tipo de almacenamiento:** uso completo del disco con LVM  

La instalación se ha realizado utilizando las opciones recomendadas por el instalador, sin incidencias.

---

## 3. Proceso de instalación

El proceso de instalación se ha realizado siguiendo las opciones por defecto del instalador de Ubuntu Server, de forma similar al servidor srv1.

Se ha configurado el sistema con soporte de acceso remoto mediante SSH y almacenamiento gestionado mediante LVM.

---

## 4. Acceso al sistema

Una vez finalizada la instalación y reiniciado el sistema, se ha comprobado el acceso mediante login en consola con el usuario creado.

---

## 5. Verificación inicial del sistema

Se ha comprobado el correcto funcionamiento básico del sistema mediante los siguientes comandos:

`whoami`  
Resultado: usuario  

`hostname`  
Resultado: srv2  

---

## 6. Estado final

Tras completar la instalación:

- Sistema operativo instalado correctamente  
- Usuario configurado y operativo  
- Acceso por consola funcional  
- Servicio SSH disponible  

El servidor queda preparado para la configuración de red y la instalación de servicios.
