# Descripción de la empresa

Esta infraestructura se ha diseñado para dar soporte a los servicios de desarrollo de software a medida y mantenimiento de aplicaciones definidos en la descripción de la empresa.

---

## 1. Tipo de empresa

La empresa simulada es una empresa de desarrollo de software especializada en la creación de aplicaciones web y soluciones empresariales a medida para clientes.

Se trata de una empresa tecnológica que requiere una infraestructura informática sólida, segura y escalable para dar soporte a sus operaciones internas y a los servicios que ofrece a sus clientes.

---

## 2. Servicios

La empresa ofrece los siguientes servicios:

- Desarrollo de aplicaciones web  
- Desarrollo de software a medida  
- Mantenimiento de aplicaciones  
- Soporte técnico a clientes  
- Formación interna para empleados y clientes  
- Gestión de proyectos tecnológicos  

Estos servicios requieren una infraestructura capaz de soportar entornos de desarrollo, almacenamiento de datos, comunicación interna y acceso remoto seguro.

---

## 3. Estructura organizativa y distribución física

La empresa está organizada en los siguientes departamentos:

- **Administración**: gestión de facturación, recursos humanos y contabilidad  
- **Dirección**: toma de decisiones estratégicas y gestión global  
- **Desarrollo**: programación y desarrollo de software  
- **Soporte técnico**: resolución de incidencias y atención al cliente  
- **Formación**: formación interna y externa  
- **CPD (Centro de Procesamiento de Datos)**: infraestructura centralizada de servidores  

### Distribución por plantas

La empresa se divide en dos plantas:

- **Planta baja**:
  - Recepción
  - Administración
  - Dirección
  - CPD (servidores)

- **Primera planta**:
  - Desarrollo
  - Soporte técnico
  - Aula de formación

Esta distribución física influye directamente en el diseño de la red, utilizando switches por planta y una topología jerárquica.

---

## 4. Segmentación de red (VLANs)

Para mejorar la seguridad, organización y rendimiento de la red, cada departamento se encuentra en una VLAN independiente:

- Administración → VLAN 10  
- Dirección → VLAN 20  
- Desarrollo → VLAN 30  
- Soporte técnico → VLAN 40  
- Formación → VLAN 50  
- Servidores (CPD) → VLAN 60  
- Gestión de red → VLAN 99  

Esta segmentación permite:

- Aislar el tráfico entre departamentos  
- Aplicar políticas de seguridad mediante ACLs  
- Mejorar el rendimiento de la red  
- Facilitar la administración  

---

## 5. Usuarios

Los principales tipos de usuarios del sistema son:

- Administradores del sistema  
- Directivos  
- Desarrolladores  
- Técnicos de soporte  
- Formadores  
- Usuarios invitados (acceso limitado a red WiFi)  

Cada tipo de usuario tendrá diferentes permisos y niveles de acceso según su rol dentro de la organización.

---

## 6. Infraestructura del CPD

El CPD centraliza los servicios críticos de la empresa. En él se ubican los servidores necesarios para el funcionamiento del sistema:

- Servidor de bases de datos  
- Servidor web / aplicaciones  
- Servidor de archivos  
- Servicios de red (DHCP, DNS)  
- Sistema de copias de seguridad  

Esto permite centralizar recursos, mejorar la seguridad y facilitar la administración del sistema.

---

## 7. Necesidades tecnológicas

Para el correcto funcionamiento de la empresa se requieren las siguientes necesidades tecnológicas:

- **Red segmentada mediante VLANs** → permite aislar departamentos y mejorar la seguridad  
- **Servidores centralizados** → alojan aplicaciones, datos y servicios internos  
- **Sistema de gestión de usuarios y permisos** → controla el acceso a recursos  
- **Acceso a internet** → necesario para desarrollo, soporte y comunicación  
- **Red WiFi para empleados e invitados** → acceso controlado y segmentado  
- **Sistema de copias de seguridad** → garantiza la recuperación ante fallos  
- **Acceso remoto seguro** → facilita el trabajo fuera de la oficina  
- **Base de datos centralizada** → almacenamiento estructurado de la información  
- **Infraestructura escalable** → permite crecimiento sin rediseñar el sistema  

---

## 8. Objetivo de la infraestructura

El objetivo de la infraestructura es diseñar e implementar un sistema informático que permita:

- Centralizar los recursos de la empresa  
- Garantizar la seguridad de la información  
- Mejorar la comunicación entre departamentos  
- Facilitar el trabajo colaborativo  
- Asegurar la disponibilidad de los servicios  
- Permitir el crecimiento de la empresa sin rediseñar el sistema  

La infraestructura debe ser eficiente, segura, escalable y adaptada a un entorno profesional real.

---

## 9. Relación con el proyecto técnico

Este documento sirve como base para el diseño del resto de la infraestructura:

- Define la estructura de red (VLANs y topología)  
- Justifica los dispositivos de red utilizados  
- Determina los servicios que se configurarán  
- Permite diseñar sistemas operativos y servidores  
- Sirve de base para la base de datos y gestión de usuarios  

De este modo, todos los módulos del proyecto intermodular quedan conectados dentro de una única infraestructura coherente.
