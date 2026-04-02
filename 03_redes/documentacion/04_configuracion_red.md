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
