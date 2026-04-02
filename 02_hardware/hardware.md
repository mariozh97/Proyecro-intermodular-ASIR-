# Memoria Técnica de Hardware - Proyecto Intermodular ASIR

---

## 1. Análisis de necesidades de hardware

La empresa es una compañía de desarrollo de software con 20 empleados distribuidos en los siguientes departamentos:

- Desarrollo (8)
- Infraestructura IT (2)
- Administración (3)
- Dirección (2)
- Soporte técnico (3)
- Formación (2)

Cada departamento presenta necesidades diferentes:

- **Desarrollo e IT** → alto rendimiento (máquinas virtuales, contenedores, compilación)
- **Administración, dirección, soporte y formación** → uso ofimático y aplicaciones de gestión
- **CPD** → ejecución de servicios críticos de la empresa

La infraestructura debe ser:

- Escalable  
- Segura  
- Preparada para trabajo continuo  
- Coherente con la segmentación en VLANs definida en la red  

---

## 2. Inventario de equipos

| Tipo de equipo | Cantidad | Uso |
|:---|:---:|:---|
| Estaciones de alto rendimiento | 10 | Desarrollo + IT |
| Estaciones estándar | 10 | Administración, dirección, soporte, formación |
| Servidor físico (virtualización) | 1 | CPD |
| Equipamiento de red | Varios | Router, switches, AP |

---

## 3. Distribución por departamento

| Departamento | Equipos |
|-------------|--------|
| Desarrollo | 8 |
| IT | 2 |
| Administración | 3 |
| Dirección | 2 |
| Soporte técnico | 3 |
| Formación | 2 |
| **TOTAL** | **20 equipos** |

---

## 4. Estaciones de trabajo

### 4.1 Perfil de alto rendimiento

Destinadas a desarrollo y administración de sistemas.

| Componente | Especificación |
|:---|:---|
| CPU | 16–24 núcleos (ej. Intel i9-14900K / Ryzen 9 7950X) |
| RAM | 64 GB DDR5 |
| Almacenamiento | 1–2 TB SSD NVMe |
| GPU | Opcional según proyecto |
| Red | 1 Gbps |

**Justificación:**

- Permiten ejecutar múltiples máquinas virtuales  
- Soportan entornos Docker  
- Facilitan compilación intensiva  

---

### 4.2 Perfil estándar

Destinadas a tareas de gestión y soporte.

| Componente | Especificación |
|:---|:---|
| CPU | 6–10 núcleos (ej. Intel i5-13500) |
| RAM | 16 GB |
| Almacenamiento | 512 GB SSD |
| Red | 1 Gbps |

**Justificación:**

- Suficiente para tareas ofimáticas  
- Bajo coste y consumo  
- Alta estabilidad  

---

## 5. Servidor del CPD

El CPD centraliza los servicios críticos de la empresa.

### Configuración física

| Componente | Especificación |
|:---|:---|
| CPU | 1–2 procesadores Xeon |
| RAM | 64–128 GB ECC |
| Almacenamiento SO | 2x SSD (RAID 1) |
| Almacenamiento datos | 4–6 HDD SAS (RAID 10) |
| Red | 2x 1GbE |
| Fuente | Redundante |

---

### 5.1 Virtualización

Se implementa virtualización mediante **Proxmox VE**, permitiendo ejecutar múltiples servidores sobre un único equipo físico.

Máquinas virtuales desplegadas:

- **SRV-AD/DNS/DHCP** → gestión de red y usuarios  
- **SRV-WEB** → alojamiento de aplicaciones  
- **SRV-BACKUP** → gestión de copias de seguridad  

**Ventajas:**

- Optimización de recursos  
- Reducción de costes  
- Escalabilidad  
- Aislamiento de servicios  

---

## 6. Sistema de almacenamiento

| Tipo | Uso |
|:---|:---|
| SSD NVMe | Sistemas cliente |
| HDD SAS | Datos empresariales |
| RAID 1 | Sistema operativo |
| RAID 10 | Datos críticos |

### Copias de seguridad

Se implementa una estrategia **3-2-1**:

- 3 copias de los datos  
- 2 soportes distintos  
- 1 copia fuera del sistema principal  

Infraestructura de backup:

- Servidor de backup dedicado  
- NAS para almacenamiento secundario  
- Copia externa adicional  

---

## 7. Alimentación y protección

- Sistemas de alimentación ininterrumpida (SAI)  
- Protección frente a cortes eléctricos  
- Apagado controlado de servidores  

---

## 7.1 Alojamiento físico (Rack)

Todo el equipamiento crítico se aloja en un armario rack estándar de 19 pulgadas ubicado en el CPD.

**Características:**

- Altura: 22U  
- Estructura metálica ventilada  
- Puerta frontal con cierre de seguridad  
- Gestión de cableado vertical y horizontal  
- Bandejas para equipos  

**Equipos alojados:**

- Servidor principal  
- Router  
- Switch principal  
- Switches de acceso  
- SAI  

**Justificación:**

- Mejora la organización del cableado  
- Facilita el mantenimiento  
- Optimiza la ventilación  
- Aumenta la seguridad física  

---

## 8. Periféricos

- Monitores duales en desarrollo  
- Teclado y ratón ergonómicos  
- Auriculares con micrófono  
- Webcam para videoconferencias  

---

## 9. Equipamiento de red

| Dispositivo | Modelo | Cantidad |
|------------|--------|----------|
| Router | Cisco 2911 | 1 |
| Switch principal | Cisco Catalyst 2960 | 1 |
| Switch acceso | Cisco Catalyst 2960 | 2 |
| Punto de acceso | AP empresarial | 1 |

---

## 10. Escalabilidad y evolución

La infraestructura permite crecimiento sin rediseño:

- Ampliación de RAM  
- Nuevos servidores  
- Implementación de NAS  
- Integración con cloud  
- Escalado horizontal  

---

## 11. Presupuesto estimado (orientativo)

Los precios indicados son estimaciones basadas en configuraciones reales del mercado profesional en 2025–2026.  
El coste final puede variar según proveedor, configuración específica y condiciones de compra.

| Equipo | Modelo | Cantidad | Precio unitario | Total |
|--------|--------|----------|-----------------|-------|
| Estación alto rendimiento | Dell Precision 3660 | 10 | 2.500 € | 25.000 € |
| Estación estándar | Dell OptiPlex | 10 | 800 € | 8.000 € |
| Servidor | Dell PowerEdge R660 | 1 | 6.000 € | 6.000 € |
| NAS | Synology DS923+ | 1 | 700 € | 700 € |
| Discos NAS | 4x 4TB | 1 | 400 € | 400 € |
| SAI | APC Smart-UPS | 2 | 800 € | 1.600 € |

**TOTAL ESTIMADO: 41.700 €**

---

## 12. Conclusión

La infraestructura propuesta proporciona:

- Rendimiento adecuado  
- Alta disponibilidad  
- Seguridad  
- Escalabilidad  

Se ha diseñado un sistema equilibrado, profesional y coherente con el resto del proyecto intermodular.
