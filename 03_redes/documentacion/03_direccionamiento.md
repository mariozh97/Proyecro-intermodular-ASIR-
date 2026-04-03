# 3. Plan de direccionamiento IP

## 3.1 Introducción

Para el correcto funcionamiento de la red, se ha definido un esquema de direccionamiento IP basado en subredes independientes para cada VLAN.

Cada departamento tendrá su propia red, lo que permite mejorar la organización, la seguridad y el control del tráfico dentro de la infraestructura.

---

## 3.2 Tabla de direccionamiento

A continuación se muestra la asignación de redes, direcciones IP y puertos:

| Departamento       | VLAN | Red              | Máscara         | Gateway         | Rango de hosts                  | Rango DHCP                      | Switch           | Puertos |
|--------------------|------|------------------|------------------|------------------|---------------------------------|---------------------------------|------------------|----------|
| Administración     | 10   | 192.168.10.0/24  | 255.255.255.0   | 192.168.10.1   | 192.168.10.1 - 192.168.10.254  | 192.168.10.100 - 192.168.10.200 | SW-Acceso-PB     | Fa0/1 - Fa0/5 |
| Dirección          | 20   | 192.168.20.0/24  | 255.255.255.0   | 192.168.20.1   | 192.168.20.1 - 192.168.20.254  | 192.168.20.100 - 192.168.20.200 | SW-Acceso-PB     | Fa0/6 - Fa0/10 |
| Desarrollo         | 30   | 192.168.30.0/24  | 255.255.255.0   | 192.168.30.1   | 192.168.30.1 - 192.168.30.254  | 192.168.30.100 - 192.168.30.200 | SW-Acceso-P1     | Fa0/1 - Fa0/10 |
| Soporte técnico    | 40   | 192.168.40.0/24  | 255.255.255.0   | 192.168.40.1   | 192.168.40.1 - 192.168.40.254  | 192.168.40.100 - 192.168.40.200 | SW-Acceso-P1     | Fa0/11 - Fa0/15 |
| Aula formación     | 50   | 192.168.50.0/24  | 255.255.255.0   | 192.168.50.1   | 192.168.50.1 - 192.168.50.254  | 192.168.50.100 - 192.168.50.200 | SW-Acceso-P1     | Fa0/16 - Fa0/20 |
| Servidores (CPD)   | 60   | 192.168.60.0/24  | 255.255.255.0   | 192.168.60.1   | 192.168.60.1 - 192.168.60.254  | -                               | SW-Principal     | Fa0/21 - Fa0/24 |
| Gestión (MGMT)     | 99   | 192.168.99.0/24  | 255.255.255.0   | 192.168.99.1   | 192.168.99.1 - 192.168.99.254  | -                               | Switch principal | VLAN de gestión |

---

Los puertos corresponden a los switches de acceso de cada planta, mientras que los servidores se conectan directamente al switch principal en la sala CPD.

---

## 3.3 Direcciones IP estáticas (servidores)

Los servidores utilizan direcciones IP fijas dentro de la VLAN 60:

- Servidor Web → 192.168.60.10  
- Servidor DNS/DHCP → 192.168.60.11  
- Servidor Backup → 192.168.60.12  

Estas direcciones quedan fuera del rango DHCP para evitar conflictos.

---

## 3.4 Justificación del direccionamiento

Se ha utilizado una red distinta para cada VLAN con el objetivo de evitar conflictos de direccionamiento y mejorar la organización de la red.

El uso de direcciones privadas del tipo 192.168.X.0/24 permite una estructura sencilla y escalable.

Los gateways se han definido como la primera dirección disponible (.1) en cada red.

El enrutamiento entre redes se realiza con router-on-a-stick, utilizando subinterfaces en el router asociadas a cada VLAN.

---

## 3.5 Organización de puertos

Los puertos de los switches se han agrupado por departamentos para facilitar la conexión de nuevos equipos en el futuro.

De esta forma, cada departamento dispone de un rango de puertos asignado, evitando desorden y facilitando la administración de la red.

Los rangos de puertos incluyen puertos adicionales reservados para futuras ampliaciones.
