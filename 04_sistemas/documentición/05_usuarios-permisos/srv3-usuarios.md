# srv3 – Gestión de usuarios y permisos

## 1. Introducción

En este documento se describe la gestión de usuarios, grupos y permisos realizada en el servidor **srv3**.

Estos elementos permiten controlar el acceso al sistema y a los recursos, garantizando una administración segura dentro de la infraestructura del proyecto.

---

## 2. Usuario principal

Durante la instalación del sistema se ha creado el usuario principal:

- **Usuario:** usuario  

Este usuario permite el acceso inicial y la administración básica del servidor.

---

## 3. Creación de usuario administrativo

Se ha creado un usuario adicional para tareas administrativas:

`sudo adduser tecnico`

---

## 4. Creación de grupo

Se ha creado un grupo para organizar usuarios con funciones administrativas:

`sudo groupadd administracion`

Se ha añadido el usuario **tecnico** al grupo:

`sudo usermod -aG administracion tecnico`

---

## 5. Asignación de privilegios

El usuario **tecnico** se ha añadido al grupo **sudo** para permitir la ejecución de tareas administrativas:

`sudo usermod -aG sudo tecnico`

---

## 6. Verificación de usuarios y grupos

Se ha comprobado la configuración mediante:

`id tecnico`

<p align="center">
  <img src="../capturas/srv3/srv3_usuario2.png" width="650">
</p>

Se observa que el usuario pertenece a los grupos:

- sudo  
- administracion  

---

## 7. Creación de directorio

Se ha creado un directorio para almacenamiento de datos:

`sudo mkdir /datos`

---

## 8. Asignación de permisos

Se ha asignado la propiedad del directorio al usuario y grupo configurados:

`sudo chown tecnico:administracion /datos`

---

## 9. Permisos avanzados

Se han aplicado permisos restrictivos:

`sudo chmod 770 /datos`

Esto permite:

- Acceso total al usuario **tecnico**  
- Acceso total al grupo **administracion**  
- Sin acceso para otros usuarios  

---

## 10. Verificación de permisos

Se ha comprobado la configuración mediante:

`ls -ld /datos`

<p align="center">
  <img src="../capturas/srv3/srv3_permisos.png" width="650">
</p>

Resultado esperado:

`drwxrwx--- tecnico administracion /datos`

---

## 11. Resumen de configuración

| Elemento | Valor |
|--------|--------|
| Usuario principal | usuario |
| Usuario administrativo | tecnico |
| Grupo creado | administracion |
| Directorio | /datos |
| Permisos | 770 |

---

## 12. Estado final

Tras completar la configuración:

- Usuarios correctamente creados  
- Grupo de administración configurado  
- Permisos asignados correctamente  
- Acceso a recursos controlado  

El servidor **srv3** dispone de una gestión adecuada de usuarios y permisos dentro de la infraestructura del proyecto.
