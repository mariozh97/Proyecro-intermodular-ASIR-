# 5. Dispositivos de red

## 5.1 Router

Se ha utilizado un router Cisco 2911 como dispositivo de capa 3 encargado del enrutamiento entre VLANs y de la conexión a Internet.

El router realiza las siguientes funciones:

- Enrutamiento inter-VLAN mediante Router-on-a-stick, utilizando subinterfaces asociadas a cada VLAN
- Aplicación de políticas de seguridad mediante ACLs
- Puerta de enlace predeterminada de todas las VLANs
- Traducción de direcciones mediante NAT para permitir la salida a Internet

---

## 5.2 Switch principal

Se ha utilizado un switch Cisco 2960 como switch principal de la red.

Sus funciones son:

- Conectar los switches de acceso mediante enlaces troncales (802.1Q)
- Centralizar la red en el CPD
- Conectar los servidores
- Transportar tráfico de múltiples VLANs

Este switch opera en capa 2, por lo que no realiza funciones de enrutamiento.

---

## 5.3 Switches de acceso

Se han utilizado dos switches Cisco 2960 como switches de acceso, uno por cada planta.

Sus funciones son:

- Conectar los equipos finales (PCs)
- Asignar los puertos a las VLANs correspondientes
- Segmentar la red por departamentos mediante VLANs

---

## 5.4 Punto de acceso (Access Point)

Se ha utilizado un punto de acceso para proporcionar conectividad inalámbrica.

Está conectado al switch de la primera planta y permite el acceso a la red desde dispositivos inalámbricos.

El punto de acceso está configurado en la VLAN 30 (red de empleados), permitiendo la conexión de dispositivos internos de la empresa.

---

## 5.5 Servidores

Se han desplegado tres servidores conectados al switch principal en la VLAN 60.

Sus funciones son:

- Servidor Web → proporciona servicios web internos
- Servidor DNS/DHCP → gestiona la resolución de nombres y la asignación automática de direcciones IP
- Servidor de Backup → encargado de copias de seguridad de los datos

La ubicación en la VLAN 60 permite aislar los servicios críticos del resto de la red.

---

## 5.6 Equipos cliente

Se han desplegado equipos cliente (PCs) distribuidos por departamentos:

- Administración
- Dirección
- Desarrollo
- Soporte técnico
- Aula de formación

Cada grupo de equipos se encuentra en su VLAN correspondiente, lo que garantiza:

- Aislamiento del tráfico
- Mejora de la seguridad
- Organización de la red
