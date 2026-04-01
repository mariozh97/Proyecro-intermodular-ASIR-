
# Memoria Técnica de Redes - Proyecto Intermodular ASIR

## 1. Análisis de necesidades de red

Para este proyecto he diseñado la infraestructura de red de una empresa de desarrollo de software con 20 empleados. La empresa está distribuida en dos plantas y tiene varios departamentos: Administración, Dirección, Desarrollo, Soporte, Formación e IT.

Antes de empezar a configurar, analicé qué necesidades tenía la red:

- **20 PCs fijos** repartidos por departamentos
- **1 servidor principal** (Server-DC) para servicios internos
- **1 servidor auxiliar** (Server-BD/DHCP) para backup y servicios auxiliares
- **Red WiFi** para empleados e invitados, con acceso diferenciado
- **Segmentación por departamentos** para mejorar la seguridad
- **Escalabilidad** para poder crecer hasta 50 empleados sin rediseñar la red

Con estos requisitos, decidí implementar VLANs para separar el tráfico, ACLs para controlar el acceso entre departamentos, y dos puntos de acceso WiFi independientes para garantizar el aislamiento de invitados.

---

## 2. VLANs y direccionamiento IP

Para organizar la red, definí 8 VLANs, cada una con su propio rango de direcciones IP. El Switch Principal (Capa 3) actúa como gateway para todas ellas.

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
El esquema lógico muestra cómo se conectan los dispositivos y qué VLANs tiene cada uno. Lo dibujé con draw.io para tener una visión clara de la estructura.

![Esquema lógico](img/Diagrama_logico_drawio.png)

### 3.2 Esquema físico
En el esquema físico he representado la ubicación real de los equipos en las dos plantas del edificio. Así se entiende mejor la distribución del cableado.

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
Para el cableado he tenido en cuenta que la red debe ser rápida y fiable:

- **Enlaces troncales (Switch Principal ↔ Switches de acceso)**: Cable UTP Categoría 6 (Gigabit Ethernet) para soportar velocidades de 1 Gbps.
- **Enlace Switch Principal ↔ Router**: Cable UTP Categoría 6.
- **Cableado horizontal (switches ↔ PCs)**: Cable UTP Categoría 5e.
- **Enlaces entre plantas**: Fibra óptica multimodo para evitar interferencias y garantizar ancho de banda.

---

## 4. Dispositivos de red

Estos son los dispositivos que he utilizado y su función en la red:

| Dispositivo | Modelo | Función | Ubicación |
|:---|:---|:---|:---|
| Router | 2911 | Salida a Internet (NAT, ruta por defecto) | CPD |
| Switch Principal | 3650-24PS | Enrutamiento entre VLANs (Capa 3) | CPD |
| Switch Planta Baja | 2960-24TT | Acceso para equipos de Planta Baja | Planta Baja |
| Switch Primera Planta | 2960-24TT | Acceso para equipos de Primera Planta | Primera Planta |
| AP-EMPLEADOS | WRT300N | WiFi empleados (SSID_EMPRESA, VLAN 30) | Primera Planta |
| AP-INVITADOS | Access Point PT | WiFi invitados (SSID_INVITADOS, VLAN 70) | Primera Planta |

### Justificación del equipamiento
He añadido algunos equipos adicionales para mejorar la disponibilidad y la seguridad:

- **Switches de acceso por planta**: Usar un switch por planta minimiza el cableado vertical y facilita el mantenimiento. Si falla un switch, solo afecta a una planta, no a toda la empresa.
- **Servidor adicional (DHCP/Backup)**: El servidor SERVIDOR-DHCP se encarga de DHCP y DNS, y también hace backup. Así, si falla el servidor principal, los servicios críticos siguen funcionando.
- **Segundo Access Point**: Prefiero tener dos puntos de acceso independientes para empleados e invitados. Así garantizo el aislamiento total entre ambas redes, que es un requisito de seguridad.

---

## 5. Configuración de VLANs y trunks

### 5.1 Switch Principal (3650)
Aquí configuré las 8 VLANs y los puertos troncales que conectan con los switches de acceso. Todos los trunks permiten las VLANs necesarias para que el tráfico llegue a su destino.

![Configuración VLANs Switch Principal](img/config_vlans_switch_principal.png)
![Configuración troncales Switch Principal](img/config_troncales_switch_principal.png)

### 5.2 Switch Planta Baja
En este switch configuré solo las VLANs que necesita la planta baja: 10, 20, 60 y 70. Los puertos de acceso los asigné según el departamento.

![Configuración VLANs Planta Baja](img/config_switch_planta_baja.png)
![Configuración trunk Planta Baja](img/config_trunk_switch_planta_baja.png)

### 5.3 Switch Primera Planta
Para la primera planta, las VLANs necesarias son 30, 40 y 50. Los puertos de acceso los asigné a Desarrollo, Soporte y Formación.

![Configuración VLANs Primera Planta](img/config_vlans_switch_primera_planta.png)

---

## 6. Enrutamiento entre VLANs

El Switch Principal es de Capa 3, así que lo configuré para que haga el enrutamiento entre VLANs mediante SVIs (Switch Virtual Interfaces). Cada VLAN tiene su interfaz virtual con su IP, que es la puerta de enlace para los equipos.

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

Para que los equipos obtengan IP automáticamente, configuré el Switch Principal como servidor DHCP. Reservé las primeras 10 IPs de cada rango para equipos con IP fija (servidores, impresoras, etc.).

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

En las pruebas, los PCs obtuvieron IP correctamente, como se ve en las capturas.

![Prueba DHCP Administración](img/prueba_dhcp_admin.png)
![Prueba DHCP Soporte](img/prueba_dhcp_soporte.png)

---

## 8. ACLs (reglas de seguridad)

Para cumplir con las políticas de seguridad, implementé ACLs extendidas en el Switch Principal. Estas reglas controlan qué tráfico está permitido entre VLANs.

| Regla | Origen | Destino | Acción | Por qué |
|:---|:---|:---|:---|:---|
| 1 | Formación (VLAN 50) | Dirección (VLAN 20) | Deny | El aula no debe acceder a datos de dirección |
| 2 | Desarrollo (VLAN 30) | Administración (VLAN 10) | Deny | Los desarrolladores no ven datos administrativos |
| 3 | Administración (VLAN 10) | Servidores (VLAN 60) | Permit | Necesario para gestionar los servidores |
| 4 | Cualquiera | Cualquiera | Permit | El resto del tráfico está permitido |

Después de aplicar las ACLs, hice varias pruebas para comprobar que funcionaban:

- **Desarrollo → Administración**: el ping falla (bloqueado)
- **Formación → Dirección**: el ping falla (bloqueado)
- **Administración → Servidores**: el ping funciona (permitido)
- **Desarrollo → Soporte**: el ping funciona (permitido)

![Configuración ACLs](img/config_acls.png)
![Prueba Desarrollo → Administración (fallo)](img/Prueba_1_Desarrollo_Administracion_debe_fallar.png)
![Prueba Formación → Dirección (fallo)](img/Prueba_2_Formacion_Direccion_debe_fallar.png)
![Prueba Administración → Servidores (éxito)](img/prueba_admin_servidor.png)
![Prueba Desarrollo → Soporte (éxito)](img/prueba_dev_soporte_ok.png)

---

## 9. Red WiFi

Para la red inalámbrica, implementé dos SSIDs independientes:

| SSID | VLAN | Autenticación | Acceso |
|:---|:---:|:---|:---|
| **SSID_EMPRESA** | 30 | WPA2-Personal (contraseña: empresa2025) | Red interna (VLAN 30) |
| **SSID_INVITADOS** | 70 | Abierta | Solo Internet, aislada |

### 9.1 Configuración de los Access Points
- **AP-EMPLEADOS** (WRT300N): Lo conecté en trunk al Switch Primera Planta con la VLAN 30. Configuré WPA2-Personal para que solo los empleados puedan conectarse.
- **AP-INVITADOS** (Access Point PT): Lo conecté en access VLAN 70. Es una red abierta, pero aislada de la red interna.

### 9.2 Pruebas WiFi
Probé ambas redes con laptops y todo funcionó correctamente:

- Los empleados obtienen IP 192.168.30.x y pueden acceder a la red interna
- Los invitados obtienen IP 192.168.70.x y no pueden acceder a la red interna (ping a 192.168.30.1 falla)

#### Empleados (VLAN 30)
![WiFi Empleados IP](img/prueba_wifi_empleados_ip.png)
![WiFi Empleados Gateway](img/prueba_wifi_empleados_gateway.png)

#### Invitados (VLAN 70)
![WiFi Invitados IP](img/prueba_wifi_invitados_ip.png)
![WiFi Invitados Gateway](img/prueba_wifi_invitados_gateway.png)
![Aislamiento Invitados](img/prueba_wifi_invitados_aislamiento.png)

---

## 10. Salida a Internet

Para dar salida a Internet, configuré NAT en el Router0. El enlace entre el Switch Principal y el router es 192.168.254.0/30, y el router tiene una ruta por defecto hacia un servidor DHCP que simula el ISP.

La configuración incluye:
- Enlace Router0 ↔ Switch Principal: 192.168.254.0/30
- Ruta por defecto en el Switch Principal hacia el router
- NAT overload para traducir las IPs internas (192.168.0.0/16) a la IP WAN
- Servidor DHCP externo (192.168.1.1) que simula el proveedor de Internet

Desde Admin-1 hice un ping a 8.8.8.8 y funcionó, lo que confirma que la salida a Internet está correcta.

![Prueba Internet desde Admin-1](img/prueba_internet_admin.png)

---

## 11. Verificación final

Antes de dar por terminada la configuración, hice una comprobación completa de todos los puntos:

| Prueba | Resultado |
|:---|:---:|
| Ping Admin-1 → Servidor-DC | Éxito |
| Ping Dev-1 → Admin-1 | Bloqueado (ACL) |
| Ping Form-1 → Dir-1 | Bloqueado (ACL) |
| Ping Dev-1 → Soporte-1 | Éxito |
| WiFi empleados → Gateway VLAN 30 | Éxito |
| WiFi invitados → Gateway VLAN 70 | Éxito |
| WiFi invitados → Red interna | Bloqueado |
| Ping Admin-1 → 8.8.8.8 | Éxito (NAT) |

![Verificación final DHCP y Ping](img/verificacion_final_DHCP_y_Ping_DEV.png)

---

## 12. Conclusiones

Después de todo el trabajo, la red cumple con los requisitos que me planteé al principio:

- **Segmentación**: 8 VLANs separan el tráfico por departamentos y funciones, mejorando la organización y la seguridad.
- **Seguridad**: Las ACLs bloquean las comunicaciones no autorizadas entre VLANs, cumpliendo las políticas de la empresa.
- **Red WiFi**: Dos SSIDs independientes con VLANs dedicadas garantizan que invitados y empleados estén separados.
- **Alta disponibilidad**: Los switches por planta, el servidor DHCP auxiliar y el SAI en el CPD aseguran que la red siga funcionando ante fallos.
- **Escalabilidad**: La red está preparada para crecer hasta 50 empleados sin necesidad de rediseñarla.
- **Cableado estructurado**: He utilizado UTP Cat6 para enlaces Gigabit y fibra óptica entre plantas, pensando en el rendimiento.

### CPD (Centro de Procesamiento de Datos)
El CPD lo he ubicado en Planta Baja y lo he equipado con:
- Armario rack de 19" con ventilación y refrigeración
- SAI para proteger los equipos de cortes eléctricos
- Cableado organizado en bandejas
- Control de acceso y temperatura

Todas las configuraciones están documentadas con capturas de pantalla y pruebas de funcionamiento. La red es funcional, segura y está preparada para un entorno empresarial real.
