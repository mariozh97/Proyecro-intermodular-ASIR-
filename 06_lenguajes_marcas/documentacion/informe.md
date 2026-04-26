# Informe – Lenguajes de Marcas

## 1. Descripción del proyecto

El proyecto consiste en la creación de un sistema de gestión de incidencias utilizando lenguajes de marcas. Se han empleado tecnologías como XML, DTD, XSLT, CSS y JSON para representar, validar y transformar datos.

El sistema simula el funcionamiento de una empresa tecnológica que gestiona clientes, proyectos e incidencias, estableciendo relaciones entre estos elementos.

---

## 2. Estructura del XML

El archivo principal `datos.xml` contiene la información estructurada en tres bloques principales:

* **Clientes**: información básica de las empresas.
* **Proyectos**: asociados a cada cliente.
* **Incidencias**: vinculadas a los proyectos.

Cada elemento utiliza identificadores (`id`) y referencias (`IDREF`) para mantener la coherencia de los datos.

---

## 3. Validación mediante DTD

Se ha creado un archivo `modelo.dtd` que define la estructura del documento XML. Este DTD permite:

* Definir la jerarquía de elementos.
* Especificar qué elementos son obligatorios.
* Controlar los atributos.
* Restringir valores (ejemplo, el estado de las incidencias).

---

## 4. Validación correcta e incorrecta

Se han realizado dos pruebas de validación:

* **XML correcto (`datos.xml`)**: cumple todas las reglas del DTD y se valida sin errores.
* **XML incorrecto (`datos_incorrecto.xml`)**: contiene errores intencionados (etiquetas mal cerradas o estructura incompleta), lo que provoca fallos en su interpretación.

Esto permite demostrar el control de errores.

---

## 5. Transformación con XSLT

Se ha desarrollado una hoja de transformación `transform.xsl` que convierte el XML en HTML.

El resultado es una tabla que muestra la información de las incidencias de forma clara, incluyendo:

* ID
* Descripción
* Estado
* Prioridad
* Fecha
* Técnico

---

## 6. Aplicación de estilos CSS

Se ha añadido una hoja de estilos `estilo.css` que mejora la presentación visual del HTML.

En las mejoras se incluyen:

* Colores en la cabecera
* Filas alternas
* Mejora de la legibilidad

---

## 7. Representación en JSON

Se ha creado un archivo `datos.json` que contiene la misma información que el XML en formato JSON.

facilita la integración con otros sistemas.

---

## 8. Integración con el proyecto intermodular

Este módulo se relaciona con otras asignaturas del ciclo:

* **Base de datos**: la estructura XML refleja tablas como clientes, proyectos e incidencias.
* **Sistemas**: los datos pueden ser servidos desde un servidor web.

---

## 9. Ejecución de la transformación XSLT

Para visualizar los datos del XML en formato HTML se utiliza una transformación XSLT.

### Pasos para ejecutar la transformación:

1. Abrir el proyecto en Visual Studio Code.
2. Asegurarse de que la extensión **Live Server** está activa.
3. Abrir el archivo:

   ```
   xml/datos.xml
   ```
4. Hacer clic derecho sobre el archivo y seleccionar:
   **Open with Live Server**
5. El navegador abrirá automáticamente la URL:

   ```
   http://127.0.0.1:5500/xml/datos.xml
   ```
6. El XML se transformará automáticamente en HTML gracias al archivo XSLT asociado.
7. Se mostrará una tabla con las incidencias, incluyendo:

   * ID
   * Descripción
   * Estado
   * Prioridad
   * Fecha
   * Técnico
8. El diseño visual se aplica mediante la hoja de estilos CSS.

### Resultado esperado

Se obtiene una visualización en formato tabla con estilo, facilitando la lectura de los datos.

---

## 10. Conclusión

Se ha desarrollado un sistema completo de gestión de datos estructurados, incluyendo:

* Creación de datos (XML)
* Validación (DTD)
* Transformación (XSLT)
* Presentación (CSS)
* Interoperabilidad (JSON)
