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
| **srv1** | DNS, Samba y SSH | DHCP (192.168.1.x) |
| **srv2** | Servidor Web (Apache) | DHCP (192.168.1.x) |
| **srv3** | Servidor DHCP | 10.0.2.15 |

---

## 4. Entorno de trabajo

- **Hipervisor:** VirtualBox  
- **Sistema operativo:** Ubuntu Server 24.04 LTS  
- **Configuración de red:**
  - Adaptador puente: srv1 y srv2  
  - NAT: srv3  

---

## 5. Instalación del sistema operativo

En todos los servidores se ha seguido el mismo procedimiento:

1. Creación de la máquina virtual  
2. Asignación de recursos (CPU, RAM y almacenamiento)  
3. Instalación de Ubuntu Server  
4. Configuración inicial del sistema (usuario, hostname y acceso SSH)  
5. Actualización del sistema mediante `apt`  

---

## 6. Configuración de red y conectividad

La configuración de red se ha realizado mediante DHCP en todos los servidores para asegurar la salida a Internet y la comunicación interna inicial.

Se han verificado los siguientes aspectos:
- Asignación correcta de dirección IP.
- Conectividad a Internet (repositorios).
- Visibilidad entre nodos.

---

## 7. Consideraciones sobre el entorno virtual

Debido al uso de VirtualBox, los servidores no se encuentran completamente integrados en el esquema de direccionamiento definido en el diseño de red teórico del proyecto.

En un entorno real, todos los servidores estarían configurados con direcciones IP estáticas dentro de las VLANs definidas, siguiendo el plan de direccionamiento establecido en el diseño de red empresarial.

---

## 8. Servicios implementados por servidor

### 8.1 srv1 – Servidor de infraestructura
Este servidor proporciona servicios internos clave para el almacenamiento y resolución de nombres:
- **Servicio DNS** para resolución de nombres interna.
- **Servicio Samba** para compartición de archivos entre departamentos.
- **Acceso remoto** mediante SSH.

---

### 8.2 srv2 – Servidor web
Se ha instalado y configurado el servidor web Apache para dar soporte al departamento de desarrollo.

**Comandos utilizados:**
```bash
sudo apt update
sudo apt install apache2 -y
