# srv3 – Configuración del sistema

## 1. Introducción

En este documento se describe la configuración del servidor **srv3**, una vez finalizada la instalación del sistema operativo.

Este servidor tiene como función principal actuar como **servidor DHCP** dentro de la infraestructura del proyecto.

---

## 1.1 Objetivo de la configuración

El objetivo de esta fase es preparar el servidor **srv3** para su funcionamiento como servidor DHCP dentro de la infraestructura del proyecto.

Se configuran los servicios, la red, los usuarios y los permisos necesarios para garantizar el correcto funcionamiento del sistema.

---

## 2. Configuración de red

Se ha verificado la configuración de red mediante el comando `ip a`.

<p align="center">
  <img src="../capturas/srv3/srv3_interfaz_red.png" width="650">
</p>

El servidor obtiene dirección IP automáticamente mediante DHCP.

- **Dirección IP:** 10.0.2.15  
- **Interfaz:** enp0s3  

---

## 3. Instalación del servicio DHCP

Se ha instalado el servidor DHCP mediante el siguiente comando:

`sudo apt install isc-dhcp-server -y`

<p align="center">
  <img src="../capturas/srv3/srv3_dhcp_instalado.png" width="650">
</p>

---

## 4. Configuración del servicio DHCP

### 4.1 Configuración de la interfaz

Se ha configurado la interfaz de red en la que escuchará el servicio DHCP.

Archivo modificado: `/etc/default/isc-dhcp-server`

Configuración aplicada:

`INTERFACESv4="enp0s3"`

---

### 4.2 Configuración del rango DHCP

Se ha configurado el archivo `/etc/dhcp/dhcpd.conf` con el siguiente contenido:

`subnet 10.0.2.0 netmask 255.255.255.0 {  
  range 10.0.2.50 10.0.2.100;  
  option routers 10.0.2.2;  
  option domain-name-servers 8.8.8.8;  
}`

Esta configuración permite asignar direcciones IP automáticamente a los equipos de la red.

---

## 5. Activación del servicio

Se ha iniciado el servicio DHCP mediante:

`sudo systemctl restart isc-dhcp-server`

Se ha comprobado su estado con:

`systemctl status isc-dhcp-server`

<p align="center">
  <img src="../capturas/srv3/srv3_dhcp_activo.png" width="650">
</p>

El servicio se encuentra en estado **active (running)**.

---

## 6. Verificación del servicio

Para comprobar el funcionamiento del servicio DHCP se pueden revisar los logs del sistema:

`sudo journalctl -u isc-dhcp-server`

Esto permite verificar la actividad del servicio y posibles asignaciones de direcciones IP.

---

## 7. Gestión de usuarios

Se ha creado un usuario adicional para tareas administrativas:

`sudo adduser tecnico`  
`sudo usermod -aG sudo tecnico`

<p align="center">
  <img src="../capturas/srv3/srv3_usuario2.png" width="650">
</p>

---

## 8. Gestión de permisos

Se ha creado un directorio para almacenamiento de datos:

`sudo mkdir /datos`  
`sudo chown tecnico:tecnico /datos`

<p align="center">
  <img src="../capturas/srv3/srv3_permisos.png" width="650">
</p>

---

## 9. Comprobaciones finales

Se han realizado las siguientes comprobaciones para verificar el correcto funcionamiento del servidor:

`sudo systemctl is-active isc-dhcp-server`  
Resultado: active  

`sudo ss -tulpn | grep dhcp`  
Resultado: servicio escuchando correctamente en la red  

`sudo journalctl -u isc-dhcp-server`  
Resultado: sin errores críticos  

Estas comprobaciones permiten verificar que el servicio DHCP está activo y funcionando correctamente.

---

## 10. Estado final

Tras completar la configuración:

- Red correctamente configurada  
- Servicio DHCP instalado y en funcionamiento  
- Usuario administrativo creado  
- Permisos configurados correctamente  

El servidor **srv3** queda preparado para su funcionamiento dentro de la infraestructura del proyecto.
