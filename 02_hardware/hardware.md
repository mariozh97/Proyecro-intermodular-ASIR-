# 📄 MEMORIA TÉCNICA DE HARDWARE  
**Proyecto Intermodular ASIR**

---

## 📑 Índice

1. Introducción  
2. Análisis de necesidades  
3. Dimensionamiento de la infraestructura  
4. Equipos cliente y periféricos  
 4.1 Workstations de alto rendimiento (Desarrollo e IT)  
 4.2 Equipos de perfil medio (Administración y Formación)  
5. Servidor del CPD  
6. Componentes hardware explicados  
7. Justificación de la elección del hardware  
8. Explicación técnica de las placas base  
9. Almacenamiento y copias de seguridad  
10. Equipamiento del CPD y Oficina  
11. Equipamiento de red (Networking)  
12. Garantías y ciclo de vida del hardware  
13. Presupuesto detallado  
14. Evidencias de compra (Enlaces)  
15. Limitaciones de la solución  
16. Conclusión  

---

## 1. Introducción

El presente documento recoge el diseño y la justificación del hardware necesario para la implantación de la infraestructura informática de una empresa dedicada al desarrollo de software.

El objetivo es definir una arquitectura sólida, segura y escalable. Se ha planteado un modelo centralizado donde un servidor de alto rendimiento asume la carga de servicios y virtualización, mientras que los equipos cliente se ajustan a la carga de trabajo específica de cada departamento. Este enfoque permite optimizar el uso de recursos, facilitar la administración y reducir costes operativos.

---

## 2. Análisis de necesidades

La empresa está formada por 20 empleados. Se han identificado perfiles técnicos diferenciados para garantizar la potencia necesaria en tareas de compilación sin sobredimensionar los puestos administrativos.

| Departamento        | Perfil Técnico | Nivel de exigencia | Cantidad |
|--------------------|----------------|-------------------|----------|
| Desarrollo / IT    | Workstation    | Muy Alto          | 10       |
| Administración     | Oficina        | Medio-Bajo        | 4        |
| Dirección          | Oficina        | Medio-Bajo        | 2        |
| Soporte / Formación| Oficina        | Medio             | 4        |
| **Total Empleados**|                |                   | **20** |

---

## 3. Dimensionamiento de la infraestructura

Se ha diseñado una infraestructura capaz de soportar el trabajo concurrente de los 20 usuarios. La red se basa en un backbone Gigabit, con almacenamiento centralizado y redundante en el servidor principal y un sistema de backup externo desacoplado para asegurar la continuidad de negocio ante fallos críticos.

---

## 4. Equipos cliente y periféricos

### 4.1 Equipos de alto rendimiento (Workstations)

![Workstation Precision](capturas/precision3660.jpeg)

| Componente | Especificación |
|------------|----------------|
| **Modelo** | **Dell Precision 3660** |
| CPU | Intel Core i9-14900K (arquitectura híbrida: 8 P-cores + 16 E-cores) |
| RAM | 64 GB DDR5 |
| Almacenamiento | 2 TB SSD NVMe Gen4 |
| GPU | NVIDIA RTX 4070 |

**Justificación:** Orientados a tareas intensivas de compilación y virtualización. Cada puesto incluye **2 Monitores Dell 27" 4K** para maximizar la productividad y multitarea.

---

### 4.2 Equipos de perfil medio (Oficina)

![PC Optiplex](capturas/optiplex.jpg)

| Componente | Especificación |
|------------|----------------|
| **Modelo** | **Dell OptiPlex 7020 Micro** |
| CPU | Intel Core i5-14500 |
| RAM | 16 GB DDR5 |
| Almacenamiento | 512 GB SSD NVMe |

**Justificación:** Diseñados para tareas administrativas y formación. Cada puesto incluye **1 Monitor Dell 24" Full HD**.

---

## 5. Servidor del CPD

![Servidor PowerEdge](capturas/servidor_r660.png)

| Componente | Especificación |
|------------|----------------|
| **Modelo** | **Dell PowerEdge R660** |
| CPU | 2× Intel Xeon Silver 4410Y |
| RAM | 128 GB ECC DDR5 |
| Red | 2× 1GbE (con agregación de enlaces) |
| Sistema | RAID 1 (SSD para sistema operativo) |
| Datos | RAID 10 (SAS para máquinas virtuales y datos) |
| Fuente | Doble Redundante Hot-Plug |

**Justificación:** Es el núcleo del sistema. Ofrece procesamiento paralelo elevado para virtualización intensiva.  
El RAID 10 distribuye los datos en espejo y en paralelo, permitiendo mantener el servicio activo incluso ante fallos de disco sin degradación crítica del rendimiento.  
El sistema está orientado a funcionamiento continuo 24/7 y preparado para ampliaciones futuras sin sustituir la infraestructura base.

---

## 6. Componentes hardware explicados

| Componente | Función técnica y valor añadido |
|------------|---------------------------------|
| **RAM ECC** | Detecta y corrige errores de bits, esencial para la estabilidad del servidor. |
| **RAID 10** | Combina redundancia y velocidad, ideal para bases de datos y virtualización. |
| **SSD NVMe Gen4** | Altas tasas de transferencia que eliminan cuellos de botella en compilación. |
| **iDRAC9** | Permite gestión remota completa del servidor a nivel hardware. |

---

## 7. Justificación de la elección del hardware

Se han seleccionado fabricantes líderes (Dell, Cisco, APC) por su fiabilidad, soporte técnico y compatibilidad con entornos profesionales.

**Alternativas evaluadas:** Se consideraron configuraciones de menor coste (i7 y 32 GB RAM), pero se descartaron debido a la reducción en la capacidad de virtualización simultánea y aumento de tiempos de compilación.

---

## 8. Explicación técnica de las placas base

Las placas base del servidor soportan doble socket y memoria ECC registrada, mientras que las Workstations emplean chipset **W680**, diseñado para estabilidad profesional 24/7 y soporte PCIe de última generación.

---

## 9. Almacenamiento y copias de seguridad

![NAS Synology](capturas/nas_synology.png)

Se instala un **NAS Synology DS923+** en configuración **RAID 5**.

Este sistema proporciona tolerancia a fallo de un disco y un equilibrio óptimo entre capacidad y redundancia.  
Permite copias automáticas, versionado de archivos y restauración granular, facilitando la recuperación ante errores humanos o fallos críticos.  
Actúa como almacenamiento desacoplado del servidor principal, garantizando la disponibilidad de los datos.

---

## 10. Equipamiento del CPD y Oficina

![Rack CPD](capturas/rack_22u.jpg)

* **Armario Rack 22U:** Centraliza el hardware y optimiza la ventilación.  
* **SAI APC Smart-UPS 1500VA:** Protección eléctrica y autonomía para apagado controlado.  
* **Impresora:** HP LaserJet Enterprise MFP compartida en red.  
* **Proyector:** Epson EB-L210W para formación técnica.

---

## 11. Equipamiento de red (Networking)

La red se segmenta mediante **VLANs** para separar el tráfico de Desarrollo, Administración y Servidores.

* **Router:** Cisco 2911 (NAT, ACLs y VPN).  
* **Switches:** 2× Cisco Catalyst 2960 (acceso y distribución).  
* **Cableado:** Cat6 Gigabit.  

La segmentación permite aplicar políticas de control de tráfico y mejorar la seguridad interna.  
El backbone se basa en Gigabit Ethernet, con posibilidad de migración futura a 10GbE.

---

## 12. Garantías y ciclo de vida del hardware

* **Soporte:** Dell ProSupport 3 años (Next Business Day).  
* **Ciclo de vida:** 5 años clientes / 6 años servidor.

---

## 13. Presupuesto detallado

| Equipo | Cantidad | Precio Unitario | Total |
|--------|----------|-----------------|-------|
| Workstations | 10 | 2.500 € | 25.000 € |
| Monitores 4K | 20 | 280 € | 5.600 € |
| PCs oficina | 10 | 739 € | 7.390 € |
| Monitores FHD | 10 | 130 € | 1.300 € |
| Servidor | 1 | 13.266 € | 13.266 € |
| NAS | 1 | 1.050 € | 1.050 € |
| Rack | 1 | 322 € | 322 € |
| SAI | 1 | 973 € | 973 € |
| Impresora | 1 | 480 € | 480 € |
| Proyector | 1 | 620 € | 620 € |
| Networking | 1 | 1.500 € | 1.500 € |

**TOTAL: 57.501 € (sin IVA)**

---

## 14. Evidencias de compra (Enlaces)

- Dell Precision → https://www.dell.com/es-es/shop/workstations/sf/precision-desktops  
- OptiPlex → https://www.pccomponentes.com/mini-pc-dell-optiplex-7020-micro-intel-core-i5-14500t-16gb-512gb-ssd-windows-11-pro  
- PowerEdge → https://www.dell.com/es-es/shop/ipovw/poweredge-r660xs  
- SAI → https://www.idealo.es/precios/2752175/apc-smart-ups-1500va-lcd-rm.html  
- NAS → https://www.pccomponentes.com/synology-diskstation-ds923-servidor-de-almacenamiento-nas  
- Rack → https://armariosrack.es/rack-19-pulgadas-22u  

---

## 15. Limitaciones de la solución

* **SPOF:** Un único servidor físico.  
* **Red:** 1 Gbps puede ser limitante en cargas altas.  

Estas limitaciones no afectan al funcionamiento actual, pero deben considerarse en futuras ampliaciones.

---

## 16. Conclusión

La solución propuesta es profesional, equilibrada y preparada para el crecimiento. Garantiza rendimiento en los puestos críticos y estabilidad en el sistema global, con una infraestructura centralizada segura y escalable.
