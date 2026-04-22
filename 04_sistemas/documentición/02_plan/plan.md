# Plan de implantación del sistema

## 1. Introducción

En este documento se describe el proceso de implantación de los sistemas operativos y servicios dentro de la infraestructura diseñada para la empresa.

El objetivo es definir cómo se despliegan los servidores, cómo se configuran y cómo se integran en la red.

---

## 2. Entorno de implantación

La implantación se ha realizado en un entorno virtualizado utilizando **VirtualBox**.

Características del entorno:

- Sistema anfitrión: equipo físico  
- Software de virtualización: VirtualBox  
- Sistemas operativos: Ubuntu Server 24.04 LTS  

---

## 3. Consideraciones sobre la red

La infraestructura se ha implementado en un entorno de virtualización utilizando diferentes modos de red de VirtualBox.

Los servidores **srv1 y srv2** utilizan adaptador en modo puente, lo que les permite integrarse directamente en la red local del equipo anfitrión.

Por otro lado, el servidor **srv3** se ha configurado en modo NAT, obteniendo direccionamiento dentro del rango 10.0.2.0/24 proporcionado por VirtualBox.

Esta configuración responde a un entorno de laboratorio, donde se prioriza la simulación funcional de los servicios sobre la uniformidad de red.

En un entorno empresarial real, todos los servidores estarían configurados dentro de la misma red con direccionamiento IP estático para garantizar la comunicación y la estabilidad de los servicios.

---

## 4. Servidores desplegados

Se han implantado los siguientes servidores:

| Servidor | Función |
|--------|--------|
| srv1 | Servidor DNS |
| srv2 | Servidor Web (Apache) |
| srv3 | Servidor DHCP |

---

## 5. Tipo de instalación

La instalación se ha realizado de forma manual mediante imagen ISO oficial de Ubuntu Server.

Se han configurado:

- Usuario principal  
- Nombre del sistema  
- Servicio SSH  
- Almacenamiento automático  

Este método permite un mayor control sobre la configuración del sistema.

---

## 6. Proceso de implantación

El proceso seguido ha sido el siguiente:

1. Creación de las máquinas virtuales  
2. Asignación de recursos (CPU, RAM, disco)  
3. Carga de la imagen ISO  
4. Instalación del sistema operativo  
5. Configuración inicial (usuario, hostname, red)  
6. Instalación de servicios  
7. Verificación del funcionamiento  

Este procedimiento se ha aplicado a cada uno de los servidores.

---

## 7. Configuración de servicios

Se han configurado los siguientes servicios en la infraestructura:

- **srv1:** servidor DNS  
- **srv2:** servidor web Apache  
- **srv3:** servidor DHCP  

En el caso del servidor DHCP:

- Rango de direcciones: 10.0.2.50 – 10.0.2.100  
- Puerta de enlace: 10.0.2.2  
- Servidor DNS: 8.8.8.8  

---

## 8. Verificación del sistema

Se han realizado las siguientes comprobaciones para validar el funcionamiento de la infraestructura:

- Verificación de usuarios y sistema: `whoami`, `hostname`  
- Comprobación de red: `ip a`  
- Estado de servicios: `systemctl status`  
- Revisión de logs: `journalctl`  

Estas pruebas permiten confirmar que los servidores están operativos y los servicios funcionando correctamente.

---

## 9. Conclusiones

La implantación del sistema se ha realizado correctamente en un entorno de laboratorio virtualizado.

Se han desplegado los servidores necesarios y configurado los servicios requeridos, permitiendo simular una infraestructura empresarial funcional.

El sistema permite:

- Resolución de nombres (DNS)  
- Acceso a servicios web  
- Asignación automática de direcciones IP  

La solución implementada es coherente con los objetivos del proyecto y adecuada para un entorno de pruebas.
