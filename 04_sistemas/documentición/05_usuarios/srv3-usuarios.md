# srv3 – Gestión de usuarios

## 1. Introducción

En este documento se describe la gestión de usuarios realizada en el servidor **srv3**.

La gestión de usuarios permite controlar el acceso al sistema y asignar permisos adecuados según el rol dentro de la infraestructura.

---

## 2. Usuario principal

Durante la instalación del sistema se ha creado el usuario principal:

- **Usuario:** usuario  

Este usuario permite el acceso inicial al sistema y la administración básica del servidor.

---

## 3. Creación de usuario administrativo

Se ha creado un usuario adicional para tareas administrativas:

`sudo adduser tecnico`

---

## 3.1 Creación de grupo

Se ha creado un grupo para organizar usuarios con funciones administrativas:

`sudo groupadd administracion`

El usuario **tecnico** se ha añadido al grupo:

`sudo usermod -aG administracion tecnico`

Esto permite una gestión más estructurada de los permisos en el sistema.

---

## 4. Asignación de privilegios

El usuario creado se ha añadido al grupo **sudo** para permitir la ejecución de tareas administrativas:

`sudo usermod -aG sudo tecnico`

---

## 5. Verificación

Se ha comprobado la correcta configuración mediante:

`id tecnico`

<p align="center">
  <img src="../capturas/srv3/srv3_usuario2.png" width="650">
</p>

Se observa que el usuario pertenece a los grupos:

- sudo  
- administracion  

---

## 6. Estado final

Tras la configuración:

- Usuario principal operativo  
- Usuario administrativo creado  
- Grupo de administración configurado  
- Permisos correctamente organizados  

El sistema permite una gestión adecuada de usuarios dentro del servidor **srv3**.
