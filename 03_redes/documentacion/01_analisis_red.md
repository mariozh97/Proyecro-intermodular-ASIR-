# 1. Análisis de necesidades de red

La empresa planteada en este proyecto es una empresa de desarrollo de software con un total de 20 empleados.

Para que la empresa funcione correctamente, es necesario diseñar una red que permita la comunicación entre los distintos departamentos, el acceso a servidores internos y la conexión a Internet, manteniendo al mismo tiempo un nivel adecuado de seguridad.

---

## 1.1 Estructura de la empresa

La empresa se distribuye en dos plantas:

### Planta baja
- Recepción
- Administración
- Dirección
- Sala de servidores (CPD)

### Primera planta
- Desarrollo
- Soporte técnico
- Aula de formación

Esta distribución influye directamente en el diseño de la red, ya que será necesario utilizar varios switches para organizar las conexiones.

---

## 1.2 Dispositivos de red necesarios

Para montar la infraestructura de red se necesitan los siguientes dispositivos:

- Ordenadores (PCs) para los empleados de cada departamento  
- 3 servidores:
  - Servidor web  
  - Servidor DNS/DHCP  
  - Servidor de copias de seguridad  
- Switches de acceso para cada planta  
- Un switch principal para la interconexión de la red  
- Un router para proporcionar acceso a Internet y realizar el enrutamiento entre VLANs (router-on-a-stick)  
- Un punto de acceso WiFi para conexiones inalámbricas  
- 1 impresora de red compartida entre Administración y Dirección  

---

## 1.3 Necesidades funcionales de la red

La red debe permitir:

- Comunicación entre equipos del mismo departamento  
- Comunicación controlada entre distintos departamentos  
- Acceso a los servidores internos  
- Acceso a Internet  
- Separación de la red mediante VLANs para mejorar la organización  
- Asignación automática de direcciones IP mediante DHCP (gestionado por un servidor dedicado)  
- Control de acceso entre redes mediante ACLs  
- Uso de red WiFi tanto para empleados como para invitados  

---

## 1.4 Requisitos de seguridad

Se establecen las siguientes reglas de seguridad:

- El aula de formación no podrá acceder a la red de Dirección  
- El departamento de Desarrollo no podrá acceder a Administración  
- Administración sí podrá acceder a los servidores  
- Solo la VLAN de gestión podrá administrar los dispositivos de red  

Estas restricciones se aplicarán mediante listas de control de acceso (ACLs).

---

## 1.5 Justificación técnica

Para organizar la red se utilizarán VLANs, ya que permiten separar los distintos departamentos y mejorar la seguridad.

El enrutamiento entre VLANs se realizará mediante la técnica **router-on-a-stick**, utilizando el router conectado al switch principal mediante un enlace troncal 802.1Q.

El uso de un servidor dedicado para DHCP permite centralizar la gestión de direcciones IP y facilita la administración de la red.

Las ACLs permiten controlar qué redes pueden comunicarse entre sí, lo cual es importante para cumplir las políticas de seguridad.

Se utilizará una topología jerárquica con switches y router, ya que es una forma habitual de organizar redes en empresas y permite que la red sea escalable.

---

## 1.6 Resumen cuantitativo de equipos

A continuación se detalla el número de dispositivos conectados en la red:

| Departamento       | PCs | Otros dispositivos                  | Total |
|--------------------|-----|------------------------------------|-------|
| Administración     | 2   | 1 impresora                        | 3     |
| Dirección          | 2   | -                                  | 2     |
| Desarrollo         | 8   | -                                  | 8     |
| Soporte técnico    | 4   | -                                  | 4     |
| Aula de formación  | 4   | 1 proyector                        | 5     |
| Servidores (CPD)   | -   | 3 servidores                       | 3     |
| Red inalámbrica    | -   | 1 punto de acceso                  | 1     |
| **TOTAL**          | **20 PCs** | **6 dispositivos adicionales** | **26 equipos** |
