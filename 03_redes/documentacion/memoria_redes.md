# Memoria Técnica de Redes - Proyecto Intermodular ASIR

## 1. Análisis de necesidades de red

La empresa cuenta con 20 empleados distribuidos en diferentes departamentos en dos plantas. Se ha diseñado una red con segmentación por VLANs para garantizar seguridad, rendimiento y aislamiento entre departamentos.

### Equipos a conectar:
- 20 PCs fijos (Administración, Dirección, Desarrollo, Soporte, Formación)
- 1 servidor principal (Server-DC)
- 1 servidor auxiliar (Server-BD / DHCP)
- 2 laptops para pruebas WiFi
- 2 Access Points para redes inalámbricas

### Requisitos de seguridad:
- Separación de tráfico por departamentos mediante VLANs
- Políticas de acceso (ACLs) para restringir comunicaciones entre VLANs
- Red WiFi separada para empleados e invitados
- VLAN de gestión (MGMT) para administración de dispositivos de red

### Escalabilidad:
La red está diseñada para soportar hasta 50 empleados ampliando switches, puntos de acceso y utilizando el cableado estructurado existente.

---

## 2. VLANs y direccionamiento IP

| VLAN | Nombre | Red IP | Gateway | Equipos | Cantidad |
|:---:|:---|:---|:---|:---|:---:|
| 10 | ADMIN | 192.168.10.0/24 | 192.168.10.1 | Administración | 3 |
| 20 | DIR | 192.168.20.0/24 | 192.168.20.1 | Dirección | 2 |
| 30 | DEV | 192.168.30.0/24 | 192.168.30.1 | Desarrollo + IT | 10 |
| 40 | SOPORTE | 192.168.40.0/24 | 192.168.40.1 | Soporte técnico | 3 |
| 50 | FORMACION | 192.168.50.0/24 | 192.168.50.1 | Aula formación | 2 |
| 60 | SRV | 192.168.60.0/24 | 192.168.60.1 | Servidores | 2 |
| 70 | INVITADOS | 192.168.70.0/24 | 192.168.70.1 | WiFi invitados | - |
| 99 | MGMT | 192.168.99.0/24 | 192.168.99.1 | Gestión de red | 1 |

**Total equipos:** 21 (20 PCs + 1 servidor principal) + 1 servidor auxiliar

---

## 3. Topología de red

### 3.1 Esquema lógico
El esquema lógico muestra la estructura de VLANs, direccionamiento IP y conexiones entre dispositivos de red.

![Esquema lógico](img/Diagrama_logico_drawio.png)

### 3.2 Esquema físico
La distribución física respeta la ubicación real de los equipos en las dos plantas del edificio.

#### Planta Baja
| Ubicación | Equipos | VLAN |
|:---|:---|:---:|
| CPD (Armario rack 19") | Switch Principal (3650), Router0, Servidor-DHCP, Servidor-DC, Servidor-BD | 60 |
| Oficina Administración | 3 PCs | 10 |
| Oficina Dirección | 2 PCs | 20 |

#### Primera Planta
| Ubicación | Equipos | VLAN |
|:---|:---|:---:|
| Oficina Desarrollo | 10 PCs | 30 |
| Oficina Soporte | 3 PCs | 40 |
| Aula Formación | 2 PCs | 50 |
| Pasillo | AP-EMPLEADOS (WRT300N), AP-INVITADOS | 30 / 70 |

#### Ubicación flexible
| Equipo | VLAN |
|:---|:---:|
| Mgmt-1 | 99 |

### 3.3 Cableado estructurado
- **Enlaces troncales (Switch Principal ↔ Switches de acceso)**: Cable UTP Categoría 6 (Gigabit Ethernet) para soportar velocidades de 1 Gbps.
- **Enlace Switch Principal ↔ Router**: Cable UTP Categoría 6.
- **Cableado horizontal (switches ↔ PCs)**: Cable UTP Categoría 5e.
- **Enlaces entre plantas**: Fibra óptica multimodo para evitar interferencias y garantizar ancho de banda.

---

## 4. Dispositivos de red

| Dispositivo | Modelo | Función | Ubicación |
|:---|:---|:---|:---|
| Router | 2911 | Salida a Internet (NAT, ruta por defecto) | CPD |
| Switch Principal | 3650-24PS | Enrutamiento entre VLANs (Capa 3) | CPD |
| Switch Planta Baja | 2960-24TT | Acceso para equipos de Planta Baja | Planta Baja |
| Switch Primera Planta | 2960-24TT | Acceso para equipos de Primera Planta | Primera Planta |
| AP-EMPLEADOS | WRT300N | WiFi empleados (SSID_EMPRESA, VLAN 30) | Primera Planta |
| AP-INVITADOS | Access Point PT | WiFi invitados (SSID_INVITADOS, VLAN 70) | Primera Planta |

### Justificación del equipamiento adicional
- **Switches de acceso por planta**: Se ha utilizado un switch por planta para minimizar el tendido de cableado vertical, facilitar el mantenimiento y mejorar la redundancia. Si falla un switch, solo afecta a una planta.
- **Servidor adicional (DHCP/Backup)**: El servidor SERVIDOR-DHCP se utiliza para servicios auxiliares (DHCP, DNS) y backup, asegurando la continuidad del negocio en caso de fallo del servidor principal.
- **Segundo Access Point**: Se han implementado dos puntos de acceso independientes para garantizar el aislamiento total entre redes de empleados e invitados, cumpliendo con políticas de seguridad.

---

## 5. Configuración de VLANs y trunks

### 5.1 Switch Principal (3650)
Se configuraron 8 VLANs y los puertos troncales para conectar los switches de acceso.

![Configuración VLANs Switch Principal](img/config_vlans_switch_principal.png)
![Configuración troncales Switch Principal](img/config_troncales_switch_principal.png)

### 5.2 Switch Planta Baja
VLANs configuradas: 10, 20, 60, 70. Puertos de acceso asignados según departamentos.

![Configuración VLANs Planta Baja](img/config_switch_planta_baja.png)
![Configuración trunk Planta Baja](img/config_trunk_switch_planta_baja.png)

### 5.3 Switch Primera Planta
VLANs configuradas: 30, 40, 50. Puertos de acceso para Desarrollo, Soporte y Formación.

![Configuración VLANs Primera Planta](img/config_vlans_switch_primera_planta.png)

---

## 6. Enrutamiento entre VLANs

El Switch Principal (Capa 3) realiza el enrutamiento mediante **SVIs (Switch Virtual Interfaces)**. Cada VLAN tiene su interfaz virtual con su dirección IP, que actúa como gateway para los equipos de esa VLAN.

| VLAN | Interfaz Virtual | IP Gateway |
|:---:|:---|:---|
| 10 | Vlan10 | 192.168.10.1 |
| 20 | Vlan20 | 192.168.20.1 |
| 30 | Vlan30 | 192.168.30.1 |
| 40 | Vlan40 | 192.168.40.1 |
| 50 | Vlan50 | 192.168.50.1 |
| 60 | Vlan60 | 192.168.60.1 |
| 70 | Vlan70 | 192.168.70.1 |
| 99 | Vlan99 | 192.168.99.1 |

![Verificación interfaces L3](img/verificacion_interfaces_L3_OK.png)

---

## 7. DHCP

Se configuró el **Switch Principal como servidor DHCP** para todas las VLANs, con exclusión de las primeras 10 IPs por rango para equipos con IP fija (servidores, impresoras, etc.).

| VLAN | Rango DHCP (IPs asignables) |
|:---:|:---|
| 10 | 192.168.10.11 - 192.168.10.254 |
| 20 | 192.168.20.11 - 192.168.20.254 |
| 30 | 192.168.30.11 - 192.168.30.254 |
| 40 | 192.168.40.11 - 192.168.40.254 |
| 50 | 192.168.50.11 - 192.168.50.254 |
| 60 | 192.168.60.11 - 192.168.60.254 |
| 70 | 192.168.70.11 - 192.168.70.254 |
| 99 | 192.168.99.11 - 192.168.99.254 |

![Prueba DHCP Administración](img/prueba_dhcp_admin.png)
![Prueba DHCP Soporte](img/prueba_dhcp_soporte.png)

---

## 8. ACLs (reglas de seguridad)

Se implementaron las siguientes políticas de acceso mediante **ACLs extendidas** en el Switch Principal:

| Regla | Origen | Destino | Acción | Justificación |
|:---|:---|:---|:---|:---|
| 1 | Formación (VLAN 50) | Dirección (VLAN 20) | Deny | Aislar datos sensibles del aula |
| 2 | Desarrollo (VLAN 30) | Administración (VLAN 10) | Deny | Proteger datos administrativos |
| 3 | Administración (VLAN 10) | Servidores (VLAN 60) | Permit | Necesario para gestión |
| 4 | Cualquiera | Cualquiera | Permit | Resto de tráfico permitido |

![Configuración ACLs](img/config_acls.png)
![Prueba Desarrollo → Administración (fallo)](img/Prueba_1_Desarrollo_Administracion_debe_fallar.png)
![Prueba Formación → Dirección (fallo)](img/Prueba_2_Formacion_Direccion_debe_fallar.png)
![Prueba Administración → Servidores (éxito)](img/prueba_admin_servidor.png)
![Prueba Desarrollo → Soporte (éxito)](img/prueba_dev_soporte_ok.png)

---

## 9. Red WiFi

Se han implementado dos redes WiFi independientes para cumplir con los requisitos de seguridad:

| SSID | VLAN | Autenticación | Acceso |
|:---|:---:|:---|:---|
| **SSID_EMPRESA** | 30 | WPA2-Personal (empresa2025) | Red interna (VLAN 30) |
| **SSID_INVITADOS** | 70 | Abierta | Solo Internet, aislada |

### 9.1 Configuración Access Points
- **AP-EMPLEADOS** (WRT300N): Conectado en trunk al Switch Primera Planta, permitiendo VLAN 30. Configurado con WPA2-Personal.
- **AP-INVITADOS** (Access Point PT): Conectado en access VLAN 70 al Switch Primera Planta. Red abierta sin autenticación.

### 9.2 Pruebas WiFi

#### Empleados (VLAN 30)
![WiFi Empleados IP](img/prueba_wifi_empleados_ip.png)
![WiFi Empleados Gateway](img/prueba_wifi_empleados_gateway.png)

#### Invitados (VLAN 70)
![WiFi Invitados IP](img/prueba_wifi_invitados_ip.png)
![WiFi Invitados Gateway](img/prueba_wifi_invitados_gateway.png)
![Aislamiento Invitados](img/prueba_wifi_invitados_aislamiento.png)

---

## 10. Salida a Internet

Se ha configurado **NAT (Network Address Translation)** en el Router0 para permitir la salida a Internet desde todas las VLANs.

### Configuración implementada:
- Enlace Router0 ↔ Switch Principal: 192.168.254.0/30
- Ruta por defecto en Switch Principal hacia el router
- NAT overload para traducir IPs internas (192.168.0.0/16) a la IP WAN
- Servidor DHCP externo (192.168.1.1) simula el ISP

### Pruebas de conectividad
![Prueba Internet desde Admin-1](img/prueba_internet_admin.png)

---

## 11. Verificación final

Se realizaron pruebas de conectividad entre todas las VLANs y dispositivos WiFi, confirmando el correcto funcionamiento de la red.

| Prueba | Resultado |
|:---|:---:|
| Ping Admin-1 → Servidor-DC | Éxito |
| Ping Dev-1 → Admin-1 | Bloqueado (ACL) |
| Ping Form-1 → Dir-1 | Bloqueado (ACL) |
| Ping Dev-1 → Soporte-1 |Éxito |
| WiFi empleados → Gateway VLAN 30 | Éxito |
| WiFi invitados → Gateway VLAN 70 | Éxito |
| WiFi invitados → Red interna | Bloqueado |
| Ping Admin-1 → 8.8.8.8 | Éxito (NAT) |

![Verificación final DHCP y Ping](img/verificacion_final_DHCP_y_Ping_DEV.png)

---

## 12. Conclusiones

La infraestructura de red diseñada cumple con todos los requisitos del proyecto y está preparada para un entorno empresarial real:

- **Segmentación**: 8 VLANs separan el tráfico por departamentos y funciones
- **Seguridad**: ACLs bloquean comunicaciones no autorizadas entre VLANs
- **Red WiFi**: Dos SSIDs independientes con VLANs dedicadas para empleados e invitados
- **Alta disponibilidad**: Switches por planta, servidor DHCP auxiliar y SAI en el CPD
- **Escalabilidad**: La red puede crecer añadiendo más equipos, switches y puntos de acceso
- **Cableado estructurado**: UTP Cat6 para enlaces Gigabit, fibra óptica para enlaces entre plantas

### CPD (Centro de Procesamiento de Datos)
El CPD se ubica en Planta Baja y cuenta con:
- Armario rack de 19" con ventilación y sistema de refrigeración
- Alimentación eléctrica con SAI (Sistema de Alimentación Ininterrumpida)
- Cableado estructurado organizado en bandejas
- Control de acceso y temperatura para garantizar disponibilidad 24/7

Todas las configuraciones han sido documentadas con capturas de pantalla y pruebas de funcionamiento, demostrando la correcta implementación de VLANs, enrutamiento inter-VLAN, DHCP, ACLs y WiFi.
