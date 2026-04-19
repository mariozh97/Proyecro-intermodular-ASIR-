# srv1 – Instalación del servidor

## 1. Introducción

Se ha desplegado una máquina virtual denominada **srv1** utilizando Ubuntu Server 24.04 LTS en VirtualBox.

---

## 2. Parámetros de instalación

Durante el proceso de instalación se han configurado los siguientes valores:

- **Nombre del sistema:** srv1  
- **Usuario principal:** usuario  
- **Instalación de OpenSSH:** habilitada  
- **Tipo de almacenamiento:** uso completo del disco con LVM  

La instalación se ha realizado utilizando las opciones recomendadas por el instalador, sin incidencias.

---

## 3. Proceso de instalación

### 3.1 Inicio de la instalación

<p align="center">
  <img src="../capturas/srv1/instalacion_inicio.png" width="750">
</p>

---

### 3.2 Selección del tipo de instalación

<p align="center">
  <img src="../capturas/srv1/instalacion_tipo.png" width="750">
</p>

---

### 3.3 Configuración del disco

<p align="center">
  <img src="../capturas/srv1/disco_configuracion.png" width="750">
</p>

---

### 3.4 Resumen de particionado

<p align="center">
  <img src="../capturas/srv1/disco_resumen.png" width="750">
</p>

---

## 4. Acceso al sistema

Una vez finalizada la instalación y reiniciado el sistema, se ha comprobado el acceso mediante login en consola con el usuario creado.

<p align="center">
  <img src="../capturas/srv1/terminal_login.png" width="650">
</p>

---

## 5. Verificación inicial del sistema

Se ha comprobado el correcto funcionamiento básico del sistema mediante los siguientes comandos:

`whoami`  
Resultado: usuario  

`hostname`  
Resultado: srv1  

---

## 6. Estado final

Tras completar la instalación:

- Sistema operativo instalado correctamente  
- Usuario configurado y operativo  
- Acceso por consola funcional  
- Servicio SSH disponible  

El servidor queda preparado para la configuración de red y la instalación de servicios.
