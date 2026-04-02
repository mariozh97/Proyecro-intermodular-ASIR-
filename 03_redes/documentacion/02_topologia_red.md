# 2. Diseño de la topología de red

## 2.1 Tipo de topología

Se ha elegido una topología jerárquica, ya que es la más utilizada en entornos empresariales.

Esta topología se divide en:

- Capa de acceso (switches por planta)
- Capa de distribución (switch principal)
- Capa de salida (router)

---

## 2.2 Distribución de la red

La red se organiza en dos plantas:

### Planta baja
- Switch de acceso PB
- Equipos de Administración y Dirección
- Sala de servidores (CPD)

### Primera planta
- Switch de acceso P1
- Equipos de Desarrollo, Soporte técnico y Aula de formación

---

## 2.3 Dispositivos utilizados

La red estará formada por:

- 1 Router (salida a Internet)
- 1 Switch principal
- 2 Switches de acceso (uno por planta)
- 1 Punto de acceso WiFi
- 3 Servidores
- 20 PCs (representados de forma agrupada en el diagrama)

---

## 2.4 Conexiones de red

- Los PCs se conectan a los switches de acceso mediante enlaces de tipo access
- Los switches de acceso se conectan al switch principal mediante enlaces troncales (trunk)
- El switch principal se conecta al router
- El punto de acceso se conecta a un switch de acceso
- Los servidores se conectan al switch principal

---

## 2.5 Conexión a Internet

El router actúa como gateway de la red, proporcionando salida a Internet.

Se conecta al proveedor de servicios (ISP) mediante una interfaz WAN, permitiendo el acceso a recursos externos.

---

## 2.6 Segmentación de red (VLANs)

Para organizar la red y mejorar la seguridad, se utilizarán las siguientes VLANs:

| VLAN | Nombre       | Departamento     | Red IP              |
|------|-------------|------------------|---------------------|
| 10   | ADMIN       | Administración   | 192.168.10.0/24     |
| 20   | DIR         | Dirección        | 192.168.20.0/24     |
| 30   | DEV         | Desarrollo       | 192.168.30.0/24     |
| 40   | SOPORTE     | Soporte técnico  | 192.168.40.0/24     |
| 50   | FORMACION   | Aula formación   | 192.168.50.0/24     |
| 60   | SRV         | Servidores       | 192.168.60.0/24     |
| 99   | MGMT        | Gestión          | 192.168.99.0/24     |

---

## 2.7 Tipos de enlaces

En la red se utilizarán dos tipos de enlaces:

- **Enlaces troncales (trunk):**  
  Se utilizan entre switches y entre el switch principal y el router. Permiten transportar múltiples VLANs mediante el protocolo 802.1Q.

- **Enlaces de acceso (access):**  
  Se utilizan para conectar dispositivos finales como PCs, servidores y puntos de acceso. Cada puerto pertenece a una única VLAN.

---

## 2.8 Justificación del diseño

La utilización de una topología jerárquica permite organizar la red de forma clara y facilitar su ampliación en el futuro.

El uso de VLANs mejora la seguridad y reduce el tráfico innecesario dentro de la red.

La separación en capas (acceso, distribución y núcleo) facilita la administración, mantenimiento y resolución de problemas.

---

## 2.9 Diagrama de la topología

A continuación se muestra el diagrama lógico de la red diseñado para la empresa:

![Diagrama de red](./02_topologia_logica.png)
