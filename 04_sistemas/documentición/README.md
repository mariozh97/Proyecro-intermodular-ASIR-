# Implantación de Sistemas Operativos  
## Proyecto Intermodular ASIR - Infraestructura de Red y Servidores  

---

## Índice

1. Descripción general  
2. Objetivos  
3. Infraestructura desplegada  
4. Entorno de trabajo  
5. Instalación del sistema operativo  
6. Configuración de red y conectividad  
7. Consideraciones sobre el entorno virtual  
8. Servicios implementados por servidor  
9. Gestión de usuarios y departamentos  
10. Gestión de permisos y almacenamiento  
11. Comprobaciones realizadas  
12. Estado final y conclusión  

---

## 1. Descripción general

Este documento detalla la fase de implantación de sistemas operativos para la infraestructura de una empresa de desarrollo de software.

Se ha llevado a cabo la instalación, configuración y puesta en marcha de varios servidores basados en Ubuntu Server 24.04 LTS, cada uno con un rol específico dentro de la red.

---

## 2. Objetivos

- Implantar sistemas operativos en un entorno virtualizado  
- Configurar servicios de red esenciales  
- Implementar servidores funcionales para distintos roles  
- Gestionar usuarios y permisos  
- Verificar el correcto funcionamiento del sistema  

---

## 3. Infraestructura desplegada

Se han configurado tres servidores principales:

| Servidor | Función principal | Dirección IP |
|----------|------------------|--------------|
| srv1     | DNS, Samba y SSH | DHCP (192.168.1.x) |
| srv2     | Servidor Web (Apache) | DHCP (192.168.1.x) |
| srv3     | Servidor DHCP | 10.0.2.15 |

---

## 4. Entorno de trabajo

- Hipervisor: VirtualBox  
- Sistema operativo: Ubuntu Server 24.04 LTS  
- Configuración de red:
  - Adaptador puente: srv1 y srv2  
  - NAT: srv3  

---

## 5. Instalación del sistema operativo

En todos los servidores se ha seguido el mismo procedimiento:

1. Creación de la máquina virtual  
2. Asignación de recursos (CPU, RAM y almacenamiento)  
3. Instalación de Ubuntu Server  
4. Configuración inicial del sistema (usuario, hostname y SSH)  
5. Actualización del sistema mediante apt  

---

## 6. Configuración de red y conectividad

La configuración de red se ha realizado mediante DHCP en todos los servidores.

Se han verificado los siguientes aspectos:

- Asignación correcta de dirección IP  
- Configuración de puerta de enlace  
- Conectividad a red local  
- Conectividad a Internet  

---

## 7. Consideraciones sobre el entorno virtual

Debido al uso de VirtualBox, los servidores no se encuentran completamente integrados en el esquema de direccionamiento definido en el diseño de red del proyecto.

Las direcciones IP asignadas pertenecen a redes generadas por el propio entorno de virtualización.

En un entorno real, todos los servidores estarían configurados con direcciones IP estáticas dentro de las VLANs definidas en el diseño de red, siguiendo el plan de direccionamiento establecido.

---

## 8. Servicios implementados por servidor

### 8.1 srv1 – Servidor de infraestructura

Este servidor proporciona servicios internos clave:

- Servicio DNS para resolución de nombres  
- Servicio Samba para compartición de archivos  
- Acceso remoto mediante SSH  

---

### 8.2 srv2 – Servidor web

### 8.2 srv2 – Servidor web

Se ha instalado y configurado el servidor web Apache.

Comandos utilizados:

sudo apt update  
sudo apt install apache2 -y  

Para verificar el funcionamiento del servicio se han realizado las siguientes comprobaciones:

systemctl status apache2  
curl http://localhost  

El servicio se encuentra activo y respondiendo correctamente a peticiones HTTP.

<p align="center">
  <img src="../capturas/srv2/apache_ok.png" width="650">
</p>

---

### 8.3 srv3 – Servidor DHCP

Se ha instalado y configurado el servicio DHCP.

Instalación:

sudo apt install isc-dhcp-server -y  

Configuración aplicada:

- Red: 10.0.2.0/24  
- Rango: 10.0.2.50 – 10.0.2.100  
- Puerta de enlace: 10.0.2.2  
- DNS: 8.8.8.8  

Interfaz configurada:

INTERFACESv4="enp0s3"  

Verificación:

systemctl status isc-dhcp-server  
journalctl -u isc-dhcp-server  

El servicio se encuentra activo y funcionando correctamente.

---

## 9. Gestión de usuarios

Se ha creado un usuario administrativo:

sudo adduser tecnico  
sudo usermod -aG sudo tecnico  

Verificación:

id tecnico  

El usuario pertenece al grupo sudo y dispone de privilegios administrativos.

---

## 10. Gestión de permisos y almacenamiento

Se ha creado un directorio de trabajo:

sudo mkdir /datos  
sudo chown tecnico:tecnico /datos  

Verificación:

ls -ld /datos  

El directorio queda asignado correctamente al usuario.

---

## 11. Comprobaciones realizadas

| Comprobación | Comando | Resultado |
|-------------|--------|----------|
| IP asignada | ip a | Correcto |
| Conectividad | ping -c 4 8.8.8.8 | Correcto |
| Apache | systemctl status apache2 | Activo |
| DHCP | systemctl status isc-dhcp-server | Activo |
| Usuario | id tecnico | Correcto |
| Permisos | ls -ld /datos | Correcto |

---

## 12. Estado final y conclusión

Tras completar la implantación:

- Sistemas operativos instalados correctamente  
- Red configurada y operativa  
- Servicios activos (DNS, Samba, Apache y DHCP)  
- Usuarios y permisos configurados correctamente  

La infraestructura de servidores está plenamente operativa y preparada para integrarse en el resto del proyecto intermodular.
