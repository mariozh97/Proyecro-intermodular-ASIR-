
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
| **CPU** | Intel Core i9-14900K (24 núcleos, 32 hilos) | El procesador es el encargado de ejecutar todas las tareas. En este caso permite trabajar con compilaciones pesadas y varias máquinas virtuales o contenedores a la vez sin que el equipo se quede corto. |
| **Placa Base** | Chipset Intel Z790 | Permite conectar todos los componentes y soporta tecnologías actuales como PCIe 5.0. También deja margen para futuras ampliaciones. |
| **RAM** | 64 GB DDR5 (2x32 GB) a 6000 MHz | La RAM se usa como memoria rápida para los programas. Es importante tener bastante cantidad para poder usar Docker, máquinas virtuales y entornos de desarrollo sin ralentizaciones. |
| **Almacenamiento** | 2 TB SSD NVMe PCIe Gen4 | Este tipo de disco es mucho más rápido que un HDD. Permite abrir proyectos grandes y cargar herramientas de desarrollo mucho más rápido. |
| **Tarjeta Gráfica** | NVIDIA RTX 4070 (12 GB) | Puede ayudar en tareas de renderizado o en trabajos que usen aceleración gráfica, aunque no es el componente principal. |
| **Refrigeración** | Líquida 360 mm | Este procesador genera bastante calor. La refrigeración líquida evita que baje el rendimiento cuando se usa durante mucho tiempo. |
| **Fuente Alimentación** | 850W 80 Plus Gold | Asegura que todos los componentes reciban energía suficiente de forma estable, incluso en momentos de alta carga. |

---

### 1.3 Perfil Medio (Administración y Gestión)

**Modelo:** Dell OptiPlex 7020 SFF

| Componente | Especificación | Justificación |
|:---|:---|:---|
| **CPU** | Intel Core i5-14500 (14 núcleos) | Procesador equilibrado para tareas de ofimática, navegación web y uso de aplicaciones de empresa. |
| **Placa Base** | Chipset Intel Q670 | Placa pensada para entornos profesionales, con buena estabilidad y opciones de gestión. |
| **RAM** | 16 GB DDR5 | Suficiente para trabajar con varias aplicaciones abiertas sin problemas. |
| **Almacenamiento** | 512 GB SSD NVMe | Permite que el sistema arranque rápido y que los programas funcionen de forma ágil. |
| **Formato** | SFF (Small Form Factor) | Ocupa poco espacio y es cómodo para oficinas. |
| **Fuente Alimentación** | 260W 80 Plus Platinum | Consumo eficiente y suficiente para este tipo de equipo. |

---

### 1.4 Servidor Rack (CPD)

**Modelo:** Dell PowerEdge R450

| Componente | Especificación | Justificación |
|:---|:---|:---|
| **Función** | Servidor principal | Se encarga de centralizar usuarios (Active Directory), bases de datos, archivos y aplicaciones internas. |
| **CPU** | 2x Intel Xeon Silver 4309Y | Procesadores preparados para funcionar de forma continua y gestionar varios servicios a la vez. |
| **RAM** | 32 GB DDR4 ECC | La memoria ECC corrige errores automáticamente, lo que ayuda a evitar fallos en sistemas críticos. |
| **Almacenamiento OS** | 2x 480 GB SSD SATA (RAID 1) | El sistema operativo está duplicado. Si un disco falla, el servidor sigue funcionando. |
| **Almacenamiento Datos** | 4x 2 TB HDD SAS (RAID 10) | Combina rendimiento y seguridad. Permite que el sistema siga funcionando incluso si falla algún disco. |
| **Controladora RAID** | PERC H755 | Gestiona los discos y mejora el rendimiento del sistema de almacenamiento. |
| **Fuentes Alimentación** | 2x 800W redundantes | Si una fuente falla, la otra sigue funcionando sin apagar el servidor. |

---

### 1.5 Almacenamiento y Protección

| Elemento | Especificación | Justificación |
|:---|:---|:---|
| **RAID en servidor** | RAID 1 + RAID 10 | Permite seguir trabajando aunque falle un disco y mejora el rendimiento en acceso a datos. |
| **SSD vs HDD** | SSD NVMe en puestos / HDD en servidor | Los SSD son rápidos para trabajar, mientras que los HDD permiten almacenar más datos a menor coste. |
| **Backup externo** | Disco externo 8 TB | Copias de seguridad semanales para evitar pérdida de información. |
| **SAI** | 2 unidades 1500VA | Protegen los equipos ante cortes de luz y permiten apagarlos correctamente. |

---

### 1.6 Periféricos

| Periférico | Cantidad | Especificación | Justificación |
|:---|:---:|:---|:---|
| Monitor | 20 | 27" QHD | Permite trabajar con varias ventanas cómodamente. |
| Monitor adicional | 10 | 24" FHD | Segundo monitor para desarrollo y soporte. Mejora la productividad. |
| Teclado + Ratón | 20 | Inalámbrico | Mayor comodidad y menos cables. |
| Auriculares | 15 | Con micrófono | Para reuniones y soporte técnico. |
| Webcam | 15 | 1080p | Para videollamadas. |

---

### 1.7 Evolución y Mejora del Sistema

Si la empresa crece, la infraestructura se puede ampliar sin cambiar todo el sistema:

- Añadir más RAM a los equipos de desarrollo
- Incorporar un segundo servidor para mejorar la disponibilidad
- Ampliar el almacenamiento con más discos
- Mejorar la red a 10Gbps si aumenta el tráfico

También se podría combinar la infraestructura local con servicios en la nube para adaptarse mejor a picos de trabajo.

---

## 2. Presupuesto

| Equipo | Cantidad | Precio Unitario | Total |
|:---|:---:|:---:|:---:|
| HP OMEN 45L | 10 | 3.999 € | 39.990 € |
| Dell OptiPlex 7020 | 10 | 739 € | 7.390 € |
| Dell PowerEdge R450 | 1 | 3.856,88 € | 3.856,88 € |
| SAI 1500VA | 2 | 850 € | 1.700 € |
| Disco externo 8TB | 1 | 189 € | 189 € |
| **TOTAL** | | | **53.125,88 €** |

---

## 3. Conclusión

La infraestructura propuesta cubre las necesidades de la empresa:

- Los equipos de desarrollo permiten trabajar con cargas altas sin problemas
- Los equipos administrativos son suficientes para su uso diario
- El servidor centraliza los servicios y mejora la organización
- El sistema es ampliable en el futuro sin grandes cambios

En general, se ha buscado un equilibrio entre rendimiento, coste y posibilidad de crecimiento.
