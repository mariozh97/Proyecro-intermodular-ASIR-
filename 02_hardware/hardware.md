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
| Servidor Rack | 1 | CPD |

---

### 1.2 Perfil de Alto Rendimiento (Desarrollo e IT)

**Modelo:** HP OMEN 45L

| Componente | Especificación | Justificación |
|:---|:---|:---|
| CPU | i9-14900K | Permite compilaciones y multitarea intensiva |
| RAM | 64GB DDR5 | Soporta máquinas virtuales y Docker |
| SSD | 2TB NVMe | Alta velocidad de carga |
| Refrigeración | Líquida | Evita pérdida de rendimiento |
| Fuente | 850W | Energía estable |

---

### 1.3 Perfil Medio (Administración)

**Modelo:** Dell OptiPlex 7020 SFF

| Componente | Especificación | Justificación |
|:---|:---|:---|
| CPU | i5-14500 | Suficiente para tareas de oficina |
| RAM | 16GB | Multitarea fluida |
| SSD | 512GB NVMe | Rapidez en uso diario |
| Formato | SFF | Ahorro de espacio |

---

### 1.4 Servidor (CPD)

**Modelo:** Dell PowerEdge R450

| Componente | Especificación | Justificación |
|:---|:---|:---|
| CPU | Xeon | Trabajo continuo |
| RAM | ECC | Evita errores |
| RAID | RAID 1 + 10 | Seguridad de datos |
| Fuente | Redundante | Alta disponibilidad |

---

### 1.5 Almacenamiento

- SSD NVMe en equipos → velocidad  
- HDD en servidor → capacidad  
- RAID → protección de datos  
- Backup externo → seguridad  

---

### 1.6 Evolución

Se podrá ampliar:
- RAM  
- almacenamiento  
- servidores  

---

## 2. Presupuesto

| Equipo | Cantidad | Precio | Total |
|:---|:---:|:---:|:---:|
| OMEN 45L | 10 | 3.999 € | 39.990 € |
| OptiPlex | 10 | 739 € | 7.390 € |
| Servidor | 1 | 3.856,88 € | 3.856,88 € |
| **TOTAL** | | | **53.125,88 €** |

*Precios aproximados basados en configuraciones reales de mercado en 2025-2026.*

---

## 3. Equipos utilizados

### PC Administración
![PC Administración](img/pc_admin_optiplex_2.png)

---

### PC Desarrollo
![PC Desarrollo](img/pc_desarrollo_omen45l_1.png)

---

### Servidor
![Servidor](img/servidor_r450_1.png)
![Servidor](img/servidor_r450_2.png)

---

## 4. Conclusión

La infraestructura propuesta permite:

- Buen rendimiento en desarrollo  
- Equipos adecuados para administración  
- Centralización de servicios  
- Posibilidad de ampliación futura  
