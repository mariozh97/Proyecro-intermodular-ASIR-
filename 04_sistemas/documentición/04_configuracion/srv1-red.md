# srv1-red – Configuración de red del servidor

## 1. Introducción

En este documento se describe la configuración de red del servidor **srv1**, realizada tras la instalación del sistema operativo.  
El objetivo es garantizar que el servidor esté correctamente integrado dentro de la red local y disponga de conectividad.

---

## 2. Interfaz de red

El servidor utiliza la siguiente interfaz de red:

- **Nombre:** enp0s3  
- **Tipo:** Adaptador de red en VirtualBox  
- **Modo:** Adaptador puente  

Para comprobar la interfaz se ha utilizado el comando:

`ip a`

Se observa que la interfaz **enp0s3** está activa.

---

## 3. Configuración de red

La configuración de red se realiza mediante DHCP, permitiendo al servidor obtener una dirección IP automáticamente mediante DHCP desde la red física.

La interfaz **enp0s3** está asociada a un adaptador en modo puente, lo que permite al servidor integrarse directamente en la red local.

---

## 4. Verificación de la configuración

### 4.1 Comprobación de IP

`ip a`

Resultado relevante:  
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> ...  
inet 192.168.1.137/24 metric 100 brd 192.168.1.255 ...  

<p align="center">
  <img src="../capturas/srv1/ip_fija_ok.png" width="650">
</p>

---

### 4.2 Conectividad externa

`ping -c 4 8.8.8.8`

Resultado:  
4 packets transmitted, 4 received, 0% packet loss  

<p align="center">
  <img src="../capturas/srv1/ping_ok.png" width="650">
</p>

---

## 5. Consideraciones sobre el entorno de red

Debido a las limitaciones del entorno de virtualización utilizado (VirtualBox), la dirección IP asignada al servidor (192.168.1.137) no se encuentra dentro del esquema de direccionamiento definido en el diseño de red del proyecto.

El uso del modo puente permite que el servidor obtenga una dirección IP directamente del router físico mediante DHCP, facilitando la conectividad durante la fase de implantación.

En un entorno real, el servidor estaría configurado con una dirección IP estática dentro de la VLAN correspondiente, siguiendo el plan de direccionamiento definido (por ejemplo 192.168.10.0/24 para servidores).

---

## 6. Estado final de la red

Tras las comprobaciones realizadas:

- Interfaz de red operativa (**enp0s3**)  
- Dirección IP obtenida correctamente mediante DHCP  
- Conectividad a red local verificada  
- Conectividad a Internet verificada  

El servidor queda correctamente configurado y preparado para la instalación de servicios.
