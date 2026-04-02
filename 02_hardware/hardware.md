# Memoria Técnica de Hardware - Proyecto Intermodular ASIR

---

## 1. Análisis de necesidades y dimensionamiento

La empresa para la que he diseñado esta infraestructura es una empresa de desarrollo de software con 20 empleados repartidos en varios departamentos: desarrollo (8), administración (3), dirección (2), soporte (3), formación (2) e infraestructura IT (2).

No todos los departamentos tienen las mismas necesidades. Los de desarrollo e IT necesitan equipos bastante más potentes, ya que trabajan con máquinas virtuales, contenedores Docker y compilación de código. En cambio, los departamentos de administración, dirección, soporte y formación pueden trabajar con equipos más sencillos.

Por eso he decidido diferenciar dos tipos de equipos, además de un servidor central que gestionará todos los servicios de la empresa.

---

## 1.1 Inventario de equipos

| Tipo de Equipo | Cantidad | Destino |
|:---|:---:|:---|
| Alto Rendimiento | 10 | Desarrollo (8) + IT (2) |
| Perfil Medio | 10 | Administración, Dirección, Soporte, Formación |
| Servidor físico | 1 | CPD (virtualización) |

He optado por un solo servidor físico porque voy a utilizar virtualización, lo que permite tener varios servidores sin necesidad de comprar hardware adicional.

---

## 1.2 Equipos de alto rendimiento

Para los equipos de desarrollo e IT he elegido una configuración basada en workstations como la Dell Precision 3660.

![Workstation](capturas/precision3660.jpeg)
Estación de trabajo Dell Precision 3660*

| Componente | Especificación | Justificación |
|:---|:---|:---|
| CPU | Intel Core i9-14900K | 24 núcleos, ideal para compilación y virtualización |
| Placa base | Chipset Z790 | Permite aprovechar CPUs de alto rendimiento y futuras ampliaciones |
| RAM | 64 GB DDR5 | Permite ejecutar múltiples máquinas virtuales |
| Almacenamiento | 2 TB SSD NVMe | Alta velocidad en carga de proyectos |
| GPU | RTX 4070 | Útil en proyectos gráficos o IA |
| Fuente | 850W 80+ Gold | Estabilidad energética |

Los equipos de alto rendimiento disponen de ranuras PCIe que permiten añadir tarjetas de expansión como GPU adicionales o tarjetas de red, lo que facilita futuras ampliaciones.

En este caso he priorizado bastante la RAM, ya que en desarrollo es más importante poder levantar entornos completos que tener una gráfica muy potente.

---

## 1.3 Equipos de perfil medio

Para administración, dirección, soporte y formación he elegido equipos tipo Dell OptiPlex.

![PC estándar](capturas/optiplex.jpg)
*Equipo de oficina Dell OptiPlex*

| Componente | Especificación | Justificación |
|:---|:---|:---|
| CPU | Intel Core i5-14500 | Buen rendimiento general |
| Placa base | Chipset Q670 | Diseñada para entornos empresariales, estable y con opciones de gestión |
| RAM | 16 GB | Suficiente para multitarea |
| Almacenamiento | 512 GB SSD | Arranque rápido y fluidez |
| Formato | SFF | Ocupa poco espacio |

Son equipos equilibrados, suficientes para el trabajo diario sin necesidad de sobredimensionar.

---

## 1.4 Servidor (CPD)

El servidor es el núcleo de la infraestructura. Aquí es donde se ejecutan todos los servicios.

He elegido un Dell PowerEdge R660.

![Servidor](capturas/servidor_r660.png)
*Servidor Dell PowerEdge R660*


| Componente | Especificación |
|:---|:---|
| CPU | 2x Intel Xeon Silver |
| RAM | 128 GB ECC |
| Almacenamiento SO | 2x 480GB SSD RAID 1 |
| Datos | 4x 2TB SAS RAID 10 |
| Red | 2x 1GbE |
| Fuente | Redundante |

He aumentado la RAM porque este servidor va a soportar varias máquinas virtuales al mismo tiempo.

Se ha optado por memoria RAM ECC (Error Correcting Code) en el servidor para evitar errores de memoria que puedan afectar a los datos, algo especialmente importante en entornos virtualizados donde se ejecutan varios servicios críticos.

Aunque esta configuración puede parecer algo elevada, he preferido asegurar margen suficiente para virtualización, evitando problemas de rendimiento a corto plazo.

---

## 1.5 Virtualización

Para optimizar recursos, he decidido usar Proxmox VE.

Dentro del servidor físico se ejecutan:

- SRV-AD/DNS/DHCP  
- SRV-WEB  
- SRV-BACKUP  

Esto permite tener los mismos servicios que en la red (Packet Tracer) pero sin necesidad de 3 servidores físicos.
Además, facilita la administración y permite migrar servicios entre máquinas virtuales en caso de fallo.

---

## 1.6 Sistema de almacenamiento

| Elemento | Uso |
|:---|:---|
| SSD NVMe | Equipos cliente |
| HDD SAS | Datos del servidor |
| RAID 1 | Sistema |
| RAID 10 | Datos |

He elegido RAID 10 porque ofrece un buen equilibrio entre rendimiento y seguridad.

### Copias de seguridad

Se sigue la regla 3-2-1:

- Servidor de backup  
- NAS  
- Copia externa  

El NAS permite separar las copias de seguridad del servidor principal, evitando que un fallo en el servidor afecte también a los backups.

![NAS](capturas/nas_synology.png)
*NAS Synology para copias de seguridad*

---

## 1.7 Alimentación y rack

Para proteger el sistema:

- SAI APC Smart-UPS  
- Rack 19” de 22U  

![Rack](capturas/rack_22u.jpg)
*Armario rack 19” de 22U*

El rack permite organizar todo el equipamiento del CPD y facilita bastante el mantenimiento.

---

## 1.8 Equipamiento de red

| Dispositivo | Modelo |
|------------|--------|
| Router | Cisco 2911 |
| Switches | Cisco 2960 |
| Access Point | AP empresarial |

Es el mismo equipamiento que se ha utilizado en la práctica de redes.

---

## 1.9 Evolución del sistema

Si la empresa crece:

- Añadir segundo servidor  
- Ampliar RAM  
- Incorporar NAS dedicado  
- Usar cloud híbrido  

---

## 2. Presupuesto estimado (orientativo)

Los precios son orientativos y pueden variar según proveedor y configuración concreta.  
Por ejemplo, el servidor puede oscilar entre 6.000 € y 8.000 € dependiendo de la cantidad de RAM, discos y soporte contratado.

| Equipo | Cantidad | Precio | Total |
|--------|----------|--------|-------|
| Workstation | 10 | 2.500 € | 25.000 € |
| PC estándar | 10 | 800 € | 8.000 € |
| Servidor | 1 | 6.000 € | 6.000 € |
| NAS | 1 | 700 € | 700 € |
| SAI | 2 | 800 € | 1.600 € |

**TOTAL: 41.300 €**

---

## 3. Conclusión

Creo que la infraestructura está bastante equilibrada:

- Los equipos de desarrollo tienen potencia suficiente  
- El servidor centraliza todos los servicios  
- La red y el hardware están alineados  
- Se puede ampliar sin tener que rehacer todo  

He intentado buscar un equilibrio entre rendimiento y coste, pensando en una empresa real que pueda crecer con el tiempo.
