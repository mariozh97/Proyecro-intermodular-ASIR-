# 3. Plan de direccionamiento IP

## 3.1 Introducción

Para el correcto funcionamiento de la red, se ha definido un esquema de direccionamiento IP basado en subredes independientes para cada VLAN.

Cada departamento tendrá su propia red, lo que permite mejorar la organización, la seguridad y el control del tráfico dentro de la infraestructura.

---

## 3.2 Tabla de direccionamiento

A continuación se muestra la asignación de redes, direcciones IP y puertos:

| Departamento       | VLAN | Red              | Máscara         | Gateway         | Switch           | Puertos |
|--------------------|------|------------------|------------------|------------------|------------------|----------|
| Administración     | 10   | 192.168.10.0/24  | 255.255.255.0   | 192.168.10.1   | SW-Acceso-PB     | Fa0/1 - Fa0/5 |
| Dirección          | 20   | 192.168.20.0/24  | 255.255.255.0   | 192.168.20.1   | SW-Acceso-PB     | Fa0/6 - Fa0/10 |
| Desarrollo         | 30   | 192.168.30.0/24  | 255.255.255.0   | 192.168.30.1   | SW-Acceso-P1     | Fa0/1 - Fa0/10 |
| Soporte técnico    | 40   | 192.168.40.0/24  | 255.255.255.0   | 192.168.40.1   | SW-Acceso-P1     | Fa0/11 - Fa0/15 |
| Aula formación     | 50   | 192.168.50.0/24  | 255.255.255.0   | 192.168.50.1   | SW-Acceso-P1     | Fa0/16 - Fa0/20 |
| Servidores (CPD)   | 60   | 192.168.60.0/24  | 255.255.255.0   | 192.168.60.1   | SW-Principal     | Fa0/21 - Fa0/24 |
| Gestión (MGMT)     | 99   | 192.168.99.0/24  | 255.255.255.0   | 192.168.99.1   | Todos (trunk)    | VLAN nativa |

---

Los puertos indicados corresponden a los switches de acceso de cada planta, mientras que los servidores se conectan directamente al switch principal en la sala CPD.

---

## 3.3 Justificación del direccionamiento

Se ha utilizado una red distinta para cada VLAN con el objetivo de evitar conflictos de direccionamiento y mejorar la organización de la red.

El uso de direcciones privadas del tipo 192.168.X.0/24 permite una estructura sencilla, fácil de entender y escalable.

Los gateways se han definido como la primera dirección disponible (.1) en cada red, siguiendo una práctica habitual en redes empresariales.

---

## 3.4 Organización de puertos

Los puertos de los switches se han agrupado por departamentos para facilitar la conexión de nuevos equipos en el futuro.

De esta forma, cada departamento dispone de un rango de puertos asignado, evitando desorden y facilitando la administración de la red.
