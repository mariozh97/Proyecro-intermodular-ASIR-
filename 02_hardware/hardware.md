# Memoria Técnica de Hardware - Proyecto Intermodular ASIR

## 1. Análisis de Necesidades y Dimensionamiento

Para este proyecto hemos diseñado la infraestructura hardware de una empresa de desarrollo de software con una plantilla de 20 empleados.

A la hora de elegir los equipos, hemos intentado adaptar el hardware a las necesidades reales de cada departamento, priorizando el rendimiento en desarrollo y la estabilidad en los puestos administrativos.

---

### 1.1 Inventario de Equipos

| Tipo de Equipo | Cantidad | Destino |
|:---|:---:|:---|
| Alto Rendimiento | 10 | Desarrollo (8) + Infraestructura IT (2) |
| Perfil Medio | 10 | Administración (3), Dirección (2), Soporte (3), Formación (2) |
| Servidor Rack | 1 | CPD (Centro de Procesamiento de Datos) |

---

### 1.2 Perfil de Alto Rendimiento (Desarrollo e IT)

**Modelo:** HP OMEN 45L

| Componente | Especificación | Justificación |
|:---|:---|:---|
| **CPU** | Intel Core i9-14900K (24 núcleos, 32 hilos) | Permite trabajar con compilaciones pesadas y varias máquinas virtuales o contenedores a la vez sin problemas. |
| **Placa Base** | Chipset Intel Z790 | Permite conectar todos los componentes y futuras ampliaciones. |
| **RAM** | 64 GB DDR5 | Necesaria para Docker, máquinas virtuales y desarrollo sin ralentizaciones. |
| **Almacenamiento** | 2 TB SSD NVMe | Reduce tiempos de carga y mejora el rendimiento general. |
| **GPU** | RTX 4070 | Útil para tareas gráficas o aceleración. |
| **Refrigeración** | Líquida 360 mm | Evita pérdida de rendimiento por temperatura. |
| **Fuente** | 850W 80 Plus Gold | Energía estable en carga alta. |

---

### 1.3 Perfil Medio (Administración y Gestión)

**Modelo:** Dell OptiPlex 7020 SFF

| Componente | Especificación | Justificación |
|:---|:---|:---|
| **CPU** | Intel Core i5-14500 | Suficiente para ofimática y gestión. |
| **Placa Base** | Chipset Q670 | Estabilidad en entorno profesional. |
| **RAM** | 16 GB DDR5 | Multitarea sin problemas. |
| **Almacenamiento** | 512 GB SSD NVMe | Sistema rápido y fluido. |
| **Formato** | SFF | Ocupa poco espacio. |
| **Fuente** | 260W Platinum | Eficiente para este uso. |

---

### 1.4 Servidor Rack (CPD)

**Modelo:** Dell PowerEdge R450

| Componente | Especificación | Justificación |
|:---|:---|:---|
| **Función** | Servidor principal | Centraliza usuarios, datos y servicios. |
| **CPU** | 2x Xeon Silver | Trabajo continuo y multitarea. |
| **RAM** | 32 GB ECC | Evita errores en sistemas críticos. |
| **OS** | 2x SSD RAID 1 | Sistema seguro ante fallos. |
| **Datos** | 4x HDD RAID 10 | Rendimiento + seguridad. |
| **RAID** | Controladora dedicada | Mejora rendimiento. |
| **Fuente** | Redundante | Evita apagados por fallo. |

---

### 1.5 Almacenamiento y Protección

| Elemento | Justificación |
|:---|:---|
| RAID 1 + 10 | Seguridad y continuidad |
| SSD vs HDD | Velocidad vs capacidad |
| Backup | Evitar pérdida de datos |
| SAI | Protección eléctrica |

---

### 1.6 Periféricos

| Periférico | Cantidad | Justificación |
|:---|:---:|:---|
| Monitores | 20 | Trabajo cómodo |
| Monitores extra | 10 | Más productividad |
| Teclado/ratón | 20 | Uso general |
| Auriculares | 15 | Comunicación |
| Webcam | 15 | Videollamadas |

---

### 1.7 Evolución

Se podrá:
- Ampliar RAM  
- Añadir servidores  
- Mejorar almacenamiento  
- Escalar red  

---

## 2. Presupuesto

| Equipo | Proveedor | Cantidad | Precio | Total |
|:---|:---|:---:|:---:|:---:|
| HP OMEN 45L | HP / PcComponentes | 10 | 3.999 € | 39.990 € |
| OptiPlex 7020 | Dell / Amazon | 10 | 739 € | 7.390 € |
| PowerEdge R450 | Dell | 1 | 3.856,88 € | 3.856,88 € |
| SAI | APC / Amazon | 2 | 850 € | 1.700 € |
| Disco 8TB | Amazon | 1 | 189 € | 189 € |
| **TOTAL** | | | | **53.125,88 €** |

*Precios aproximados basados en configuraciones reales de mercado en 2025-2026. Pueden variar según proveedor y disponibilidad.*

---

## 3. Equipos utilizados

### PC Administración
![PC Administración](img/pc_admin_optiplex_1.png)
![PC Administración](img/pc_admin_optiplex_2.png)

### PC Desarrollo
![PC Desarrollo](img/pc_desarrollo_omen45l_1.png)
![PC Desarrollo](img/pc_desarrollo_omen45l_2.png)

### Servidor
![Servidor](img/servidor_r450_1.png)
![Servidor](img/servidor_r450_2.png)

---

## 4. Conclusión

La infraestructura cubre las necesidades de la empresa:

- Equipos potentes para desarrollo  
- Equipos equilibrados para administración  
- Servidor centralizado  
- Sistema escalable  

Se ha buscado un equilibrio entre rendimiento, coste y crecimiento futuro.
