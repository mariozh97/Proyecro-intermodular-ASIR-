## Instalación del servidor srv1

Se ha desplegado una máquina virtual denominada **srv1** utilizando Ubuntu Server 24.04 LTS en VirtualBox.

### Parámetros de instalación

Durante el proceso de instalación se han configurado los siguientes valores:

- Nombre del sistema: srv1  
- Usuario principal: usuario  
- Instalación de OpenSSH: habilitada  
- Tipo de almacenamiento: uso completo del disco con LVM  

La instalación se ha realizado utilizando las opciones recomendadas por el instalador, sin incidencias.

---

### Proceso de instalación

#### Inicio de la instalación

<p align="center">
  <img src="../capturas/srv1/instalacion_inicio.png" width="750">
</p>

#### Selección del tipo de instalación

<p align="center">
  <img src="../capturas/srv1/instalacion_tipo.png" width="750">
</p>

#### Configuración del disco

<p align="center">
  <img src="../capturas/srv1/disco_configuracion.png" width="750">
</p>

#### Resumen de particionado

<p align="center">
  <img src="../capturas/srv1/disco_resumen.png" width="750">
</p>

---

### Acceso al sistema

Una vez finalizada la instalación y reiniciado el sistema, se ha comprobado el acceso mediante login en consola con el usuario creado.

<p align="center">
  <img src="../capturas/srv1/terminal_login.png" width="650">
</p>

---

### Verificación inicial del sistema

Se ha comprobado el correcto funcionamiento básico del sistema mediante comandos de verificación:

```bash
usuario@srv1:~$ whoami
usuario

usuario@srv1:~$ hostname
srv1
