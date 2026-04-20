# Análisis del sistema operativo

## 1. Introducción

En este apartado se analiza la elección del sistema operativo utilizado en la infraestructura del proyecto, teniendo en cuenta las necesidades de la empresa y los servicios que se van a implantar.

El proyecto simula la infraestructura IT de una empresa de desarrollo de software que requiere servidores para almacenamiento de proyectos, acceso remoto para administración y despliegue de aplicaciones web.

---

## 2. Necesidades del sistema

La infraestructura del proyecto requiere:

- Servidores estables y seguros  
- Soporte para servicios de red (SSH, Samba, Apache)  
- Administración remota de los sistemas  
- Gestión de usuarios y permisos  
- Disponibilidad continua de los servicios  
- Compatibilidad con entornos virtualizados  
- Bajo consumo de recursos  

Estas necesidades responden al uso real de los servidores dentro de la empresa simulada, donde es necesario gestionar proyectos de desarrollo y servicios accesibles desde la red.

---

## 3. Sistema operativo seleccionado

Se ha seleccionado el siguiente sistema operativo para los servidores:

- **Sistema operativo:** Ubuntu Server 24.04 LTS  

---

## 4. Justificación de la elección

Ubuntu Server ha sido seleccionado por los siguientes motivos:

- **Estabilidad:** versión LTS con soporte a largo plazo  
- **Seguridad:** actualizaciones frecuentes y sistema robusto  
- **Compatibilidad:** soporte completo para servicios como Apache, Samba y SSH  
- **Facilidad de administración:** gestión mediante terminal y herramientas estándar  
- **Amplia comunidad:** gran cantidad de documentación y soporte técnico  
- **Rendimiento:** bajo consumo de recursos, ideal para servidores virtualizados  

Además, Ubuntu Server permite una rápida implantación y configuración de servicios, lo que lo hace adecuado para entornos empresariales como el del proyecto.

---

## 5. Alternativas consideradas

Se han evaluado otras opciones antes de la selección final:

- **Debian:** muy estable y robusto, pero con menor disponibilidad de versiones recientes de software  
- **CentOS / Rocky Linux:** orientado a entornos empresariales, pero con menor uso en el contexto del proyecto  

Finalmente, se ha seleccionado Ubuntu Server por su equilibrio entre facilidad de uso, soporte y compatibilidad con los servicios necesarios.

---

## 6. Aplicación en la infraestructura

El sistema operativo se ha utilizado en dos servidores dentro de la infraestructura:

- **srv1:** servidor de archivos y acceso remoto  
  - Servicios: Samba y SSH  

- **srv2:** servidor web  
  - Servicio: Apache  

Esta distribución permite separar funciones y simular una arquitectura real de servidores en una empresa de desarrollo de software.

---

## 7. Entorno de implementación

Los servidores se han desplegado en un entorno virtualizado:

- **Software de virtualización:** VirtualBox  
- **Tipo de instalación:** máquinas virtuales  
- **Red:** adaptador puente  

Este entorno permite simular una infraestructura real dentro de una red local, facilitando las pruebas y la administración.

---

## 8. Estado final

Tras el análisis realizado:

- Sistema operativo adecuado para las necesidades de la empresa simulada  
- Compatible con los servicios requeridos en la infraestructura  
- Fácil de administrar, mantener y escalar  
- Integrado correctamente en el entorno de red  

El sistema operativo seleccionado cumple con los requisitos necesarios para el desarrollo del proyecto.

