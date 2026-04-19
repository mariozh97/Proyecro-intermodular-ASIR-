# srv1-red – Configuración de red del servidor

## 1. Introducción

En este documento se describe la configuración de red del servidor **srv1**, realizada tras la instalación del sistema operativo.  
El objetivo es garantizar que el servidor esté correctamente integrado dentro de la infraestructura de red definida en el proyecto.

---

## 1.1 Cambio de configuración de red

Durante la fase de instalación inicial del sistema, el servidor obtuvo dirección IP automáticamente mediante DHCP (192.168.1.137).

Posteriormente, dentro del diseño de la infraestructura de red del proyecto, se ha configurado una dirección IP estática (192.168.60.10) correspondiente a la VLAN de servidores.

Este cambio se realiza para garantizar estabilidad, facilitar la gestión de servicios y asegurar la correcta integración en la red segmentada por VLANs.

---

## 2. Interfaz de red

El servidor utiliza la siguiente interfaz de red:

- **Nombre:** enp0s3  
- **Tipo:** Adaptador de red en VirtualBox  
- **Modo:** Adaptador puente  

Para comprobar la interfaz se ha utilizado:

```bash
ip a
```

Se observa que la interfaz **enp0s3** está activa y disponible para su configuración.

---

## 3. Configuración de red

La configuración de red del servidor se ha realizado de forma **estática**, asignando manualmente la dirección IP para asegurar estabilidad dentro de la infraestructura.

### Parámetros configurados:

- **Dirección IP:** 192.168.60.10  
- **Máscara de red:** 255.255.255.0  
- **Puerta de enlace:** 192.168.60.1  
- **Servidor DNS:** 8.8.8.8  

---

## 4. Edición del fichero de red

Se configura la interfaz de red en modo estático para garantizar que el servidor mantenga siempre la misma dirección IP dentro de la red.

```bash
nano /etc/network/interfaces
```

Contenido del fichero:

```bash
auto enp0s3
iface enp0s3 inet static
    address 192.168.60.10
    netmask 255.255.255.0
    gateway 192.168.60.1
    dns-nameservers 8.8.8.8
```

---

## 5. Aplicación de cambios

Una vez realizada la configuración, se han aplicado los cambios reiniciando el servicio de red:

```bash
systemctl restart networking.service
```

Para comprobar el estado del servicio:

```bash
systemctl status networking
```

---

## 6. Verificación de la configuración

Para comprobar que la configuración se ha aplicado correctamente, se han realizado las siguientes pruebas:

### 6.1 Comprobación de IP

```bash
ip a
```

Se observa que la interfaz **enp0s3** tiene asignada la dirección IP **192.168.60.10** correctamente.

---

### 6.2 Conectividad con puerta de enlace

```bash
ping 192.168.60.1
```

Se reciben respuestas sin pérdida de paquetes, lo que confirma conectividad con la puerta de enlace.

---

### 6.3 Conectividad externa

```bash
ping 8.8.8.8
```

Se reciben respuestas correctamente, lo que confirma acceso a red externa.

---

### 6.4 Resolución DNS

```bash
ping google.com
```

La resolución de nombres funciona correctamente, confirmando que el servidor DNS está operativo.

---

## 7. Integración en la red

El servidor se encuentra dentro de la VLAN de servidores:

- **VLAN:** 60 (SRV)  
- **Red:** 192.168.60.0/24  

Esto permite:

- Comunicación con otros servidores  
- Acceso desde administración (según ACLs)  
- Aislamiento del resto de departamentos  

---

## 8. Conclusiones

La configuración de red del servidor **srv1** se ha realizado correctamente, cumpliendo los siguientes objetivos:

- Dirección IP fija configurada correctamente  
- Conectividad interna y externa verificada  
- Resolución DNS funcional  
- Integración adecuada en la VLAN de servidores  

El servidor queda preparado para la instalación de servicios dentro de la infraestructura del proyecto.
