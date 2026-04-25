# MEMORIA TÉCNICA DE HARDWARE  
**Proyecto Intermodular ASIR**

---

## Índice

1. Introducción  
2. Análisis de necesidades  
3. Dimensionamiento de la infraestructura  
4. Equipos cliente y periféricos  
 4.1 Workstations de alto rendimiento (Desarrollo e IT)  
 4.2 Equipos de perfil medio (Administración y Formación)  
5. Servidor del CPD  
6. Componentes hardware explicados  
7. Justificación de la elección del hardware  
8. Análisis detallado de componentes, placa base y ensamblaje  
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

El documento recoge el diseño y la justificación del hardware necesario para la implantación de la infraestructura informática de una empresa dedicada al desarrollo de software.

El objetivo es definir una arquitectura sólida, segura y escalable. Se plantea un modelo centralizado donde un servidor de alto rendimiento asume la carga de servicios y virtualización, mientras que los equipos cliente se ajustan a la carga de trabajo específica de cada departamento. Este enfoque permite optimizar el uso de recursos, facilitar la administración y reducir costes operativos.

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

Se ha diseñado una infraestructura capaz de soportar el trabajo concurrente de los 20 usuarios. La red se basa en un backbone Gigabit, con almacenamiento centralizado y redundante en el servidor principal y un sistema de backup externo desacoplado para asegurar la continuidad de negocio ante fallos críticos de hardware.

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

**Justificación:** Equipos orientados a tareas intensivas de compilación, contenedores y virtualización local. Cada puesto incluye **2 Monitores Dell 27" 4K** para maximizar la productividad y permitir un flujo de trabajo multitarea eficiente.

---

### 4.2 Equipos de perfil medio (Oficina)

![PC Optiplex](capturas/optiplex.jpg)

| Componente | Especificación |
|------------|----------------|
| **Modelo** | **Dell OptiPlex 7020 Micro** |
| CPU | Intel Core i5-14500 |
| RAM | 16 GB DDR5 |
| Almacenamiento | 512 GB SSD NVMe |

**Justificación:** Diseñados para tareas administrativas, gestión y formación. La configuración garantiza fluidez absoluta en aplicaciones de gestión y ofimática. Cada puesto incluye **1 Monitor Dell 24" Full HD**.

---

## 5. Servidor del CPD

![Servidor PowerEdge](capturas/servidor_r660.png)

| Componente | Especificación |
|------------|----------------|
| **Modelo** | **Dell PowerEdge R660** |
| CPU | 2× Intel Xeon Silver 4410Y |
| RAM | 128 GB ECC DDR5 |
| Red | 2× 1GbE (con soporte para agregación de enlaces) |
| Sistema | RAID 1 (SSD para sistema operativo) |
| Datos | RAID 10 (SAS para máquinas virtuales y datos) |
| Fuente | Doble Redundante Hot-Plug |

**Justificación:** Es el núcleo crítico del sistema. Ofrece un procesamiento paralelo elevado para virtualización intensiva. El **RAID 10** permite mantener un alto rendimiento en lectura/escritura, reduciendo la latencia en el acceso a máquinas virtuales. El chasis está preparado para ampliaciones futuras sin sustituir la infraestructura base.

---

## 6. Componentes hardware explicados

| Componente | Función técnica y valor añadido |
|------------|---------------------------------|
| **RAM ECC** | Detecta y corrige errores de bits, esencial para la estabilidad operativa del servidor. |
| **RAID 10** | Combina redundancia y velocidad máxima, ideal para bases de datos y entornos virtualizados. |
| **SSD NVMe Gen4** | Altas tasas de transferencia (hasta 7000MB/s) que eliminan cuellos de botella en compilación. |
| **iDRAC9** | Permite gestión remota completa del servidor a nivel hardware, incluso con el sistema operativo caído. |

---

## 7. Justificación de la elección del hardware

Se han seleccionado fabricantes líderes (Dell, Cisco, APC) por su fiabilidad contrastada, soporte técnico profesional y compatibilidad con entornos empresariales.

**Alternativas evaluadas:** Se consideraron configuraciones basadas en procesadores i7 y 32 GB de RAM para el departamento de desarrollo, pero se descartaron debido a la reducción significativa en la capacidad de virtualización simultánea y al aumento de tiempos de espera en tareas intensivas.

---

## 8. Análisis detallado de componentes, placa base y ensamblaje

Para cumplir con los requisitos técnicos del diseño de los puestos de alto rendimiento (Workstations), es fundamental comprender la arquitectura interna de los equipos seleccionados, la compatibilidad entre sus piezas y la función de cada elemento en la placa base.

### 8.1. Componentes clave de la Placa Base (Chipset W680)
La placa base de la **Dell Precision 3660** utiliza el chipset profesional **Intel W680** con formato ATX, que incluye los siguientes elementos técnicos:

* **Zócalo (Socket) LGA 1700:** Matriz de contactos físicos donde se aloja el procesador. Se ha elegido por ser el estándar compatible con la 14ª generación de procesadores Intel.
* **VRM (Módulo de Regulación de Voltaje):** Fases de alimentación reforzadas con disipadores de calor pasivos. Su función es reducir los 12V de la fuente al voltaje exacto (aprox. 1.2V - 1.4V) que necesita el i9-14900K, garantizando estabilidad bajo carga máxima.
* **Ranuras DIMM DDR5:** Cuatro bancos compatibles con arquitectura *Dual Channel* para duplicar el ancho de banda de comunicación con la CPU.
* **Ranuras PCIe 5.0:** Buses de alta velocidad donde se conecta la GPU RTX 4070, permitiendo el máximo flujo de datos para renderizado gráfico.
* **Puertos M.2 NVMe:** Conectores directos a la placa que utilizan líneas PCIe para evitar el cuello de botella de los antiguos protocolos SATA.

### 8.2. Elección de la Fuente de Alimentación (Certificación 80 PLUS Gold)
Para alimentar la Workstation, la elección de la fuente no se basa solo en los vatios (W), sino en su eficiencia energética. Se ha optado por una fuente de **850W con certificación 80 PLUS Gold**.

* **Justificación de potencia:** El procesador i9-14900K (TDP máximo ~253W) y la RTX 4070 (~200W) tienen consumos pico altos. Una fuente de 850W asegura que el equipo trabaje al 60-70% de su capacidad, que es el punto de máxima eficiencia, evitando el sobrecalentamiento.
* **Certificación 80 PLUS Gold:** Garantiza que al menos el 87-90% de la energía eléctrica extraída del enchufe se entrega a los componentes, perdiendo muy poca energía en forma de calor (pérdida residual).

### 8.3. Lógica de ensamblaje y refrigeración
El montaje de estos equipos sigue estrictos criterios de flujo de aire (*Airflow*):
* **Compatibilidad:** El uso del chipset W680 asegura compatibilidad total entre la memoria DDR5 y el socket LGA 1700, evitando cuellos de botella generacionales.
* **Refrigeración:** Dado el alto TDP del procesador i9, se ensambla con sistemas de disipación de doble torre o refrigeración líquida. El chasis utiliza un flujo de aire positivo (más aire entrando por el frontal que saliendo por detrás) para evitar la acumulación de polvo y mantener los VRM a temperaturas seguras (por debajo de 85°C).

---

## 9. Almacenamiento y copias de seguridad

![NAS Synology](capturas/nas_synology.png)

Se instala un **NAS Synology DS923+** en configuración **RAID 5**. Este sistema proporciona tolerancia a fallo de un disco y un equilibrio óptimo entre capacidad neta y redundancia.

Actúa como almacenamiento desacoplado del servidor principal, garantizando la disponibilidad de los datos. Permite la programación de copias automáticas, versionado de archivos y restauración granular, facilitando la recuperación ante errores humanos o ataques de ransomware.

---

## 10. Equipamiento del CPD y Oficina

![Rack CPD](capturas/rack_22u.jpg)

* **Armario Rack 22U:** Centraliza el hardware crítico y optimiza la ventilación y gestión del cableado.
* **SAI APC Smart-UPS 1500VA:** Protección eléctrica frente a picos de tensión y autonomía de batería para un apagado seguro y controlado.
* **Impresora:** HP LaserJet Enterprise MFP (láser multifunción) compartida en red para Administración y Dirección.
* **Proyector:** Epson EB-L210W de alta luminosidad para formación técnica en el aula.

---

## 11. Equipamiento de red (Networking)

La red se segmenta mediante **VLANs** para separar el tráfico por departamentos, mejorando la seguridad y reduciendo el tráfico de broadcast innecesario.

* **Router:** Cisco 2911 (gestión de NAT, ACLs y túneles VPN).
* **Switches:** 2× Cisco Catalyst 2960 de 24 puertos (gestión de acceso y distribución).
* **Cableado:** Estructurado Cat6 Gigabit para garantizar 1 Gbps estable en todos los puestos.

---

## 12. Garantías y ciclo de vida del hardware

* **Soporte:** Todos los equipos Dell incluyen garantía **ProSupport 3 años (Next Business Day)**, asegurando la continuidad de negocio.
* **Ciclo de vida:** Se establece una renovación tecnológica a los 5 años para puestos cliente y 6 años para la infraestructura de servidor central.

---

## 13. Presupuesto detallado

| Equipo o Componente | Cantidad | Precio Unitario | Total |
|---------------------|----------|-----------------|-------|
| Dell Precision 3660 | 10 | 2.500,00 € | 25.000,00 € |
| Monitores Dell 27" 4K | 20 | 280,00 € | 5.600,00 € |
| Dell OptiPlex 7020 Micro | 10 | 739,00 € | 7.390,00 € |
| Monitores Dell 24" FHD | 10 | 130,00 € | 1.300,00 € |
| Servidor Dell PowerEdge R660 | 1 | 13.266,00 € | 13.266,00 € |
| NAS Synology (con discos) | 1 | 1.050,00 € | 1.050,00 € |
| Armario Rack 22U | 1 | 322,00 € | 322,00 € |
| SAI APC Smart-UPS 1500VA | 1 | 973,00 € | 973,00 € |
| Impresora HP LaserJet MFP | 1 | 480,00 € | 480,00 € |
| Proyector Epson Aula | 1 | 620,00 € | 620,00 € |
| Networking (Router + Switches) | 1 | 1.500,00 € | 1.500,00 € |
| **TOTAL (IVA Excluido)** | | | **57.501,00 €** |

---

## 14. Evidencias de compra (Enlaces)

* **Workstations:** [Dell Precision 3660](https://www.dell.com/es-es/shop/workstations/sf/precision-desktops)
* **PCs Oficina:** [PcComponentes - OptiPlex](https://www.pccomponentes.com/mini-pc-dell-optiplex-7020-micro-intel-core-i5-14500t-16gb-512gb-ssd-windows-11-pro)
* **Servidor:** [Dell PowerEdge R660](https://www.dell.com/es-es/shop/ipovw/poweredge-r660xs)
* **SAI:** [Idealo - APC Smart-UPS](https://www.idealo.es/precios/2752175/apc-smart-ups-1500va-lcd-rm.html)
* **NAS:** [PcComponentes - Synology](https://www.pccomponentes.com/synology-diskstation-ds923-servidor-de-almacenamiento-nas)
* **Rack:** [ArmariosRack.es](https://armariosrack.es/rack-19-pulgadas-22u)

---

## 15. Limitaciones de la solución

* **SPOF (Single Point of Failure):** La existencia de un único servidor físico es un punto crítico. Se recomienda un clúster de alta disponibilidad en el futuro.
* **Ancho de banda:** La red Gigabit de 1 Gbps puede saturarse ante transferencias de datos masivos entre sistemas.

---

## 16. Conclusión

La solución planteada es profesional, equilibrada y preparada para el crecimiento. Garantiza que los departamentos técnicos dispongan de la máxima potencia, mientras centraliza la seguridad y el respaldo en una infraestructura escalable y protegida.
