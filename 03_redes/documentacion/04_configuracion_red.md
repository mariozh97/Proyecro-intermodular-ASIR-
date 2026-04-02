## 4. Configuración de la red

### 4.1 Creación de VLANs

Se han creado las VLANs necesarias en todos los switches de la red con el objetivo de segmentar los distintos departamentos de la empresa.

Las VLANs configuradas son:

| VLAN | Nombre     | Departamento     |
|------|------------|------------------|
| 10   | ADMIN      | Administración   |
| 20   | DIR        | Dirección        |
| 30   | DEV        | Desarrollo       |
| 40   | SOPORTE    | Soporte técnico  |
| 50   | FORMACION  | Aula formación   |
| 60   | SRV        | Servidores       |
| 99   | MGMT       | Gestión          |

Para su creación se ha accedido al modo de configuración de cada switch mediante CLI, creando cada VLAN y asignándole un nombre descriptivo.

La verificación se ha realizado utilizando el comando:

show vlan brief

#### Evidencia de configuración

![Configuración de VLANs](capturas/04_vlan_config.png)

---

### 4.2 Configuración de enlaces troncales (Trunk)

Se han configurado enlaces troncales entre el switch principal y los switches de acceso.

Estos enlaces permiten el transporte de múltiples VLANs a través de un único enlace físico mediante el protocolo IEEE 802.1Q.

Los puertos configurados en modo trunk son:

- Switch Principal → Switch Acceso PB  
- Switch Principal → Switch Acceso P1  

En todos los casos se ha utilizado el modo trunk para permitir la comunicación entre VLANs a través de la red.

La verificación se ha realizado mediante el comando:

show interfaces trunk

#### Evidencia de configuración

![Enlaces troncales](capturas/05_trunks.png)

---

### 4.3 Verificación de la configuración

Se ha comprobado el correcto funcionamiento de la configuración mediante los siguientes puntos:

- Existencia de todas las VLANs en los switches  
- Propagación correcta de VLANs a través de los enlaces troncales  
- Estado activo de los puertos trunk  
- Correspondencia entre VLANs creadas y diseño de red  

Los resultados obtenidos confirman que la segmentación de red se ha implementado correctamente y que la infraestructura está preparada para continuar con la asignación de puertos y configuración de servicios de red.

---

### 4.4 Asignación de puertos a VLANs

Se ha procedido a la asignación de los puertos de los switches a sus correspondientes VLANs según el departamento al que pertenecen.

Para ello se ha configurado cada puerto en modo access y se le ha asignado la VLAN correspondiente.

Esto permite que cada equipo de la red quede correctamente segmentado y aislado del resto de departamentos.

---

### 4.5 Detalle de asignación de puertos

La asignación realizada es la siguiente:

- VLAN 10 (ADMIN): Fa0/1-2 en SW-Acceso-PB  
- VLAN 20 (DIR): Fa0/6-7 en SW-Acceso-PB  

- VLAN 30 (DEV): Fa0/1-2 en SW-Acceso-P1  
- VLAN 40 (SOPORTE): Fa0/11-12 en SW-Acceso-P1  
- VLAN 50 (FORMACION): Fa0/16-17 en SW-Acceso-P1  
- VLAN 50 (Access Point): Fa0/10 en SW-Acceso-P1 (compartiendo VLAN con el aula de formación)  

- VLAN 60 (SRV): Fa0/21-23 en SW-Principal  

---

### 4.6 Evidencias de configuración

A continuación se muestran las capturas que verifican la correcta asignación de puertos a VLANs:

![Asignación VLAN - Planta Baja](capturas/06_asignacion_vlan_pb.png)

![Asignación VLAN - Planta 1](capturas/06_asignacion_vlan_p1.png)

---

### 4.7 Verificación

Se ha comprobado que los puertos de los switches se encuentran correctamente asignados a sus respectivas VLANs mediante el comando:

show vlan brief

Los resultados confirman que cada departamento está correctamente segmentado dentro de la red.

---

### 4.8 Configuración de enrutamiento inter-VLAN

Para permitir la comunicación entre las diferentes VLANs, se ha implementado enrutamiento inter-VLAN mediante la técnica Router-on-a-stick.

Esta decisión se ha tomado debido a que el switch principal (Cisco 2960) no dispone de capacidades de capa 3, por lo que no puede realizar enrutamiento entre VLANs.

Por este motivo, el enrutamiento se realiza en el router mediante subinterfaces, una por cada VLAN.

Cada subinterfaz está asociada a su correspondiente VLAN mediante el protocolo IEEE 802.1Q.

---

### 4.9 Direccionamiento del router

Se han configurado las siguientes direcciones IP en el router:

- VLAN 10 → 192.168.10.1  
- VLAN 20 → 192.168.20.1  
- VLAN 30 → 192.168.30.1  
- VLAN 40 → 192.168.40.1  
- VLAN 50 → 192.168.50.1  
- VLAN 60 → 192.168.60.1  
- VLAN 99 → 192.168.99.1  

Estas direcciones actúan como puerta de enlace predeterminada para los dispositivos de cada VLAN.

---

### 4.10 Evidencia de configuración

A continuación se muestra la verificación de las subinterfaces configuradas en el router mediante el comando:

show ip interface brief

![Subinterfaces del router](capturas/07_router_subinterfaces.png)

---

### 4.11 Verificación

Se ha comprobado que todas las subinterfaces del router se encuentran en estado "up/up", lo que indica que el enrutamiento inter-VLAN está correctamente configurado.

Esto permite la comunicación entre las distintas redes de la infraestructura.
