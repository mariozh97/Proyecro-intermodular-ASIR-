# Lenguajes de Marcas – Proyecto ASIR

## Descripción

Este módulo del proyecto intermodular consiste en el diseño, validación y transformación de datos utilizando lenguajes de marcas.

Se ha implementado un sistema de gestión de incidencias para una empresa tecnológica, empleando XML, DTD, XSLT, CSS y JSON.

---

## Tecnologías utilizadas

* XML → estructuración de datos
* DTD → validación del XML
* XSLT → transformación a HTML
* CSS → estilos visuales
* JSON → representación alternativa de datos

---

## Funcionalidades

* Definición de datos estructurados mediante XML
* Validación mediante DTD
* Detección de errores con XML incorrecto
* Transformación a HTML mediante XSLT
* Aplicación de estilos con CSS
* Conversión de datos a JSON

---

## Ejecución

1. Abrir el proyecto en Visual Studio Code
2. Abrir el archivo:

```
xml/datos.xml
```

3. Click derecho → **Open with Live Server**
4. Se abrirá en el navegador:

```
http://127.0.0.1:5500/xml/datos.xml
```

5. Se mostrará una tabla HTML con las incidencias
6. El diseño se aplica automáticamente con CSS

---

## Validación

* `datos.xml` → válido según el DTD
* `datos_incorrecto.xml` → contiene errores para demostrar validación

---

## Evidencias

### Validación correcta (DTD)

Archivo: `capturas/validacion_dtd.png`

### Validación fallida (error XML)

Archivo: `capturas/validacion_fallida.png`

### Transformación HTML

Archivo: `capturas/transform_html.png`

### Transformación HTML con CSS

Archivo: `capturas/capturas.transform_html.css.png`

### Datos en JSON

Archivo: `capturas/json_datos.png`

---

## Integración con el proyecto

Este módulo se integra con el proyecto intermodular:

* Representa datos equivalentes a una base de datos
* Puede ser servido desde un entorno web
* Facilita la visualización de información estructurada

---

## Autor

Mario Zurdo Herradón – Proyecto ASIR 1º
