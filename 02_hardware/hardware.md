# 📄 MEMORIA TÉCNICA DE HARDWARE  
**Proyecto Intermodular ASIR**

---

## 📑 Índice

1. Introducción  
2. Análisis de necesidades  
3. Dimensionamiento de la infraestructura  
4. Equipos cliente  
 4.1 Equipos de alto rendimiento  
 4.2 Equipos de perfil medio  
5. Servidor del CPD  
6. Componentes hardware explicados  
7. Justificación de la elección del hardware  
8. Explicación técnica de las placas base  
9. Almacenamiento y copias de seguridad  
10. Equipamiento del CPD  
11. Equipamiento de red  
12. Presupuesto detallado  
13. Evidencias de compra  
14. Limitaciones de la solución  
15. Conclusión  

---

## 1. Introducción

El presente documento recoge el diseño y la justificación del hardware necesario para la implantación de la infraestructura informática de una empresa dedicada al desarrollo de software.

El objetivo principal es definir una solución equilibrada que permita cubrir las necesidades reales de los distintos perfiles de usuario, garantizando un funcionamiento fluido del sistema, una correcta gestión de los recursos y la posibilidad de crecimiento a medio plazo.

La infraestructura se organiza en torno a un servidor central encargado de la virtualización y la prestación de servicios, acompañado de equipos cliente adaptados al tipo de trabajo de cada departamento. Este enfoque permite centralizar la gestión, optimizar el uso del hardware disponible y facilitar el mantenimiento del sistema.

---

## 2. Análisis de necesidades

La empresa está compuesta por un total de 20 empleados distribuidos en diferentes áreas, cada una con requisitos técnicos distintos.

Los perfiles de desarrollo y administración de sistemas requieren equipos capaces de ejecutar múltiples procesos de forma simultánea, incluyendo máquinas virtuales, herramientas de desarrollo y servicios en segundo plano. Este tipo de carga implica un uso intensivo de CPU, memoria y almacenamiento.

Por otro lado, los departamentos administrativos, de dirección y formación presentan un uso mucho más ligero del sistema, centrado principalmente en aplicaciones ofimáticas, navegación web y herramientas de gestión.

Esta diferencia de necesidades hace necesario establecer una diferenciación clara entre tipos de equipos, evitando sobredimensionar los puestos de bajo consumo y asegurando al mismo tiempo el rendimiento en los puestos críticos.

---

## 3. Dimensionamiento de la infraestructura

A partir del análisis previo, se define la siguiente estructura:

- 10 equipos de alto rendimiento destinados a desarrollo e IT  
- 10 equipos de perfil medio para el resto de usuarios  
- 1 servidor central encargado de la virtualización y servicios  

Este modelo permite ajustar los recursos a las necesidades reales de cada usuario, evitando un gasto innecesario en hardware y manteniendo un rendimiento adecuado en los entornos de trabajo más exigentes.

Además, la existencia de un servidor central facilita la concentración de servicios, lo que simplifica la administración y mejora la eficiencia del sistema.

---

## 4. Equipos cliente

### 4.1 Equipos de alto rendimiento (Workstations)

![Workstation](capturas/precision3660.jpeg)

**Configuración:**

- CPU: Intel Core i9-14900K  
- RAM: 64 GB DDR5  
- Almacenamiento: 2 TB SSD NVMe  
- GPU: NVIDIA RTX 4070  

**Precio estimado:** 2.400 – 2.800 €

**Justificación**

Estos equipos están orientados a tareas que requieren una elevada capacidad de procesamiento, como la ejecución simultánea de máquinas virtuales, compilación de proyectos o uso de entornos de desarrollo complejos.

El uso de un procesador de gama alta con múltiples núcleos permite distribuir cargas de trabajo intensivas sin que el sistema se degrade. La memoria RAM, dimensionada en 64 GB, garantiza que varias máquinas virtuales puedan ejecutarse de forma simultánea sin provocar cuellos de botella.

El almacenamiento NVMe ofrece velocidades muy superiores a los discos tradicionales, lo que se traduce en una mejora directa en tiempos de arranque, carga de aplicaciones y acceso a datos.

---

### 4.2 Equipos de perfil medio (Oficina)

![Equipo oficina](capturas/optiplex.jpg)

**Configuración:**

- CPU: Intel Core i5-14500  
- RAM: 16 GB DDR5  
- Almacenamiento: 512 GB SSD NVMe  

**Precio estimado:** 700 – 900 €

**Justificación**

Estos equipos están diseñados para tareas de baja exigencia computacional, como el uso de herramientas ofimáticas, navegación web y gestión administrativa.

El hardware seleccionado permite un funcionamiento fluido en este tipo de aplicaciones sin necesidad de recurrir a configuraciones más costosas. Esto contribuye a optimizar el presupuesto global sin comprometer la experiencia de uso.

---

## 5. Servidor del CPD

![Servidor](capturas/servidor_r660.png)

**Configuración:**

- CPU: 2× Intel Xeon Silver  
- RAM: 128 GB ECC  
- Sistema: RAID 1 (SSD)  
- Datos: RAID 10 (SAS)  

**Precio estimado:** 6.000 – 8.000 €

**Justificación**

El servidor constituye el núcleo de la infraestructura, siendo responsable de alojar los servicios principales y las máquinas virtuales utilizadas en el entorno.

El uso de procesadores Xeon está orientado a entornos de trabajo continuado, donde la estabilidad y la capacidad de procesamiento sostenido son factores clave. La memoria ECC añade una capa adicional de seguridad frente a errores, especialmente importante en sistemas que gestionan múltiples servicios simultáneamente.

La configuración de almacenamiento combina redundancia y rendimiento, permitiendo mantener la disponibilidad de los datos incluso en caso de fallo de uno o varios discos.

---

## 6. Componentes hardware explicados

**CPU**  
La unidad central de procesamiento es el elemento encargado de ejecutar las instrucciones del sistema. En entornos con múltiples procesos concurrentes, como la virtualización, el número de núcleos y la capacidad de ejecución en paralelo adquieren especial relevancia.

**RAM**  
La memoria RAM actúa como espacio de trabajo temporal. Una cantidad insuficiente puede provocar ralentizaciones importantes, especialmente cuando se ejecutan varias aplicaciones exigentes o máquinas virtuales de forma simultánea.

**Almacenamiento**  
El uso de unidades SSD NVMe mejora significativamente el rendimiento general del sistema. En entornos de servidor, los discos SAS ofrecen mayor fiabilidad y resistencia en operaciones continuadas.

**RAID**  
La implementación de RAID permite combinar varios discos para mejorar la disponibilidad de los datos y el rendimiento del sistema. RAID 1 garantiza redundancia, mientras que RAID 10 combina seguridad y velocidad.

---

## 7. Justificación de la elección del hardware

La selección del hardware se ha realizado teniendo en cuenta varios factores clave.

En primer lugar, el rendimiento necesario en los puestos de desarrollo obliga a priorizar procesadores de alta gama y una cantidad elevada de memoria RAM. Estas decisiones están directamente relacionadas con la naturaleza del trabajo que se va a realizar.

En segundo lugar, la fiabilidad del sistema se refuerza mediante el uso de tecnologías como memoria ECC, sistemas RAID y fuentes de alimentación redundantes en el servidor.

También se ha considerado la escalabilidad, seleccionando componentes que permitan futuras ampliaciones sin necesidad de sustituir completamente el sistema.

Por último, se ha buscado mantener un equilibrio entre coste y prestaciones, invirtiendo más en los elementos críticos y ajustando el gasto en aquellos puestos donde no es necesario un alto rendimiento.

---

## 8. Explicación técnica de las placas base

Las placas base utilizadas determinan en gran medida las capacidades de expansión y estabilidad del sistema.

Las plataformas de alto rendimiento incorporan soporte para memorias rápidas, múltiples dispositivos de almacenamiento y tarjetas de expansión, lo que permite adaptarse a cargas de trabajo exigentes.

En los equipos de oficina se prioriza la estabilidad y la compatibilidad, con soluciones orientadas a entornos empresariales donde la fiabilidad es más importante que el rendimiento extremo.

En el caso del servidor, la placa base incluye funcionalidades específicas como gestión remota, controladoras de almacenamiento avanzadas y soporte para memoria ECC, todas ellas orientadas a garantizar un funcionamiento continuo y estable.

---

## 9. Almacenamiento y copias de seguridad

![NAS Synology](capturas/nas_synology.png)

La estrategia de copias de seguridad se basa en mantener varias copias de la información en distintos soportes, reduciendo así el riesgo de pérdida de datos.

El uso de un sistema NAS permite disponer de un almacenamiento independiente del servidor principal, facilitando la recuperación de información en caso de fallo.

---

## 10. Equipamiento del CPD

![Rack](capturas/rack_22u.jpg)

El equipamiento del CPD está diseñado para organizar y proteger los elementos críticos de la infraestructura.

El uso de un rack permite estructurar los dispositivos de forma ordenada, facilitando su mantenimiento. El sistema de alimentación ininterrumpida protege frente a cortes eléctricos, evitando pérdidas de información y posibles daños en el hardware.

---

## 11. Equipamiento de red

La infraestructura de red se compone de un router, switches y un punto de acceso, encargados de interconectar los distintos dispositivos del sistema y permitir la comunicación entre ellos.

Estos elementos son fundamentales para garantizar el acceso a los servicios internos y la conectividad entre departamentos.

---

## 12. Presupuesto detallado

**Total estimado:** 42.300 €

El presupuesto se ha calculado tomando como referencia precios reales de mercado para configuraciones equivalentes, buscando un equilibrio entre calidad y coste.

---

## 13. Evidencias de compra

Las estimaciones de precio se han obtenido a partir de configuraciones reales disponibles en fabricantes y distribuidores, comparando diferentes opciones para obtener valores representativos del mercado actual.

---

## 14. Limitaciones de la solución

La infraestructura planteada presenta algunas limitaciones, principalmente relacionadas con la dependencia de un único servidor y la capacidad de la red.

Estas limitaciones podrían resolverse mediante la incorporación de redundancia adicional y mejoras en la infraestructura de red.

---

## 15. Conclusión

La solución propuesta permite cubrir de forma adecuada las necesidades de la empresa, ofreciendo un entorno estable, eficiente y preparado para el crecimiento.

El diseño combina rendimiento en los puestos críticos con optimización de recursos en los equipos de menor carga, logrando un equilibrio adecuado entre coste y prestaciones.

En conjunto, la infraestructura resulta coherente, funcional y alineada con los requisitos planteados.

