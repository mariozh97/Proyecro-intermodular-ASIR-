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

Se ha llevado a cabo la instalación, configuración y puesta en marcha de varios servidores basados en Ubuntu Server 24.04 LTS, cada uno con un rol específico dentro de la red empresarial, garantizando un entorno estable para el desarrollo y la gestión de datos.

---

## 2. Objetivos

- Implantar sistemas operativos robustos en un entorno virtualizado  
- Configurar servicios de red esenciales para la operativa de la empresa  
- Implementar servidores funcionales con roles diferenciados (Web, Ficheros, DNS y DHCP)  
- Gestionar usuarios y permisos según la estructura organizativa  
- Verificar la conectividad y el estado de los servicios mediante pruebas reales  

---

## 3. Infraestructura desplegada

Siguiendo el diseño técnico del proyecto, se han configurado los siguientes servidores:

| Servidor | Función principal | Dirección IP | Rol Departamental |
|----------|------------------|--------------|-------------------|
| **srv1** | DNS, Samba y SSH | DHCP (192.168.1.x) | Administración / Dirección |
| **srv2** | Servidor Web (Apache) | DHCP (192.168.1.x) | Desarrollo / Pruebas |
| **srv3** | Servidor DHCP | 10.0.2.15 | Soporte Técnico / Red |

---

## 4. Entorno de trabajo

- Hipervisor: VirtualBox  
- Sistema operativo: Ubuntu Server 24.04 LTS  
- Configuración de red:
  - Adaptador puente: srv1 y srv2  
  - NAT: srv3  

---

## 5. Instalación del sistema operativo

En todos los nodos se ha seguido un procedimiento estandarizado:

1. Creación de la máquina virtual con asignación de CPU y RAM  
2. Instalación de Ubuntu Server mediante imagen ISO  
3. Configuración del hostname y usuario inicial  
4. Activación del servicio SSH  
5. Actualización del sistema  

---

## 6. Configuración de red y conectividad

La configuración de red se ha gestionado mediante DHCP en esta fase para asegurar:

- Asignación correcta de dirección IP  
- Configuración de puerta de enlace  
- Acceso a Internet  
- Comunicación entre servidores  

---

## 7. Consideraciones sobre el entorno virtual

Debido al uso de VirtualBox, las direcciones IP asignadas pertenecen a redes del propio hipervisor.

En un entorno real, los servidores estarían configurados con direcciones IP estáticas dentro de las VLANs definidas en el diseño de red.

---

## 8. Servicios implementados por servidor

### 8.1 srv1 – Servidor de infraestructura

Este nodo centraliza servicios internos:

- DNS: Resolución de nombres  
- Samba: Compartición de archivos  
- SSH: Acceso remoto seguro  

---

### 8.2 srv2 – Servidor web

Servidor destinado al despliegue de aplicaciones web.

**Instalación:**

sudo apt update  
sudo apt install apache2 -y  

**Verificación:**

La disponibilidad del servicio se ha comprobado mediante la visualización de la página de inicio, confirmando que el servidor web está operativo.

---

### 8.3 srv3 – Servidor DHCP

Servidor encargado de automatizar el direccionamiento de la red de pruebas.

**Configuración:**

- Software: isc-dhcp-server  
- Red: 10.0.2.0/24  
- Rango de direcciones: 10.0.2.50 – 10.0.2.100  
- Puerta de enlace: 10.0.2.2  

El servicio se encuentra activo y asignando direcciones correctamente.

---

## 9. Gestión de usuarios

Se ha implementado un esquema de usuarios para la administración técnica:

- Usuario: tecnico  
- Configuración: incorporación al grupo sudo para permitir tareas administrativas  

---

## 10. Gestión de permisos y almacenamiento

Se ha creado una estructura de almacenamiento centralizada:

- Directorio: /datos  
- Permisos: asignados al usuario tecnico mediante chown  

Esto garantiza que únicamente el personal autorizado pueda gestionar los archivos.

---

## 11. Comprobaciones realizadas

| Comprobación | Herramienta / Comando | Resultado |
|-------------|----------------------|----------|
| Dirección IP | ip a | Correcto |
| Conectividad | ping -c 4 8.8.8.8 | Correcto |
| Servicio Apache | Verificación funcional | Activo |
| Servicio DHCP | systemctl status isc-dhcp-server | Activo |
| Usuario sudo | id tecnico | Correcto |
| Permisos | ls -ld /datos | Correcto |

---

## 12. Estado final y conclusión

Tras completar la fase de implantación, la infraestructura de sistemas operativos se encuentra plenamente operativa.

Se han desplegado correctamente los servicios de:

- DNS  
- Samba  
- Apache  
- DHCP  

El sistema queda preparado para su integración con el resto de módulos del proyecto intermodular.
