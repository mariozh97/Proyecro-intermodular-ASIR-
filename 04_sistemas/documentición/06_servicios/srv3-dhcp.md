# srv3 – Servicio DHCP

## 1. Introducción

En este documento se describe la instalación y configuración del servicio **DHCP** en el servidor **srv3**.

El servicio DHCP permite asignar direcciones IP automáticamente a los equipos de la red, facilitando la gestión de la infraestructura.

---

## 2. Instalación del servicio

Se ha instalado el servidor DHCP mediante el siguiente comando:

`sudo apt install isc-dhcp-server -y`

<p align="center">
  <img src="../capturas/srv3/srv3_dhcp_instalado.png" width="650">
</p>

---

## 3. Configuración del servicio

### 3.1 Configuración de la interfaz

Se ha configurado la interfaz en la que el servidor DHCP escuchará las peticiones.

Archivo: `/etc/default/isc-dhcp-server`

Configuración:

`INTERFACESv4="enp0s3"`

---

### 3.2 Configuración del rango de direcciones

Se ha editado el archivo:

`/etc/dhcp/dhcpd.conf`

Configuración aplicada:

`subnet 10.0.2.0 netmask 255.255.255.0 {  
  range 10.0.2.50 10.0.2.100;  
  option routers 10.0.2.2;  
  option domain-name-servers 8.8.8.8;  
}`

Esta configuración permite:

- Asignación automática de direcciones IP  
- Definición de puerta de enlace  
- Configuración de DNS  

---

## 4. Activación del servicio

Se ha iniciado el servicio mediante:

`sudo systemctl restart isc-dhcp-server`

Comprobación:

`systemctl status isc-dhcp-server`

<p align="center">
  <img src="../capturas/srv3/srv3_dhcp_activo.png" width="650">
</p>

El servicio se encuentra en estado:

- **active (running)**  

---

## 5. Verificación del funcionamiento

Se ha comprobado el funcionamiento del servicio mediante:

`sudo journalctl -u isc-dhcp-server`

Esto permite verificar la actividad del servidor DHCP y detectar posibles errores.

---

## 6. Estado final

Tras la configuración:

- Servicio DHCP instalado correctamente  
- Servicio activo y funcionando  
- Asignación de direcciones IP automatizada  

El servidor **srv3** cumple su función como servidor DHCP dentro de la red del proyecto.
