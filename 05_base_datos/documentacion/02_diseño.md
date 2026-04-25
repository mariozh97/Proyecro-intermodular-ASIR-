# 02_diseño.md

## 1. Introducción

En este documento se realiza el diseño lógico de la base de datos a partir del modelo Entidad-Relación previamente definido.

El objetivo es transformar las entidades y relaciones del modelo conceptual en un modelo relacional, listo para su implementación en un sistema gestor de bases de datos mediante SQL.

---

## 2. Transformación del modelo E-R al modelo relacional

A partir del diagrama E-R se han identificado las siguientes tablas:

* Cliente
* Proyecto
* Departamento
* Empleado
* Incidencia
* Empleado_Incidencia
* Empleado_Proyecto

---

## 3. Definición de tablas

### 3.1 Tabla Cliente

| Campo      | Tipo     | Descripción                     |
| ---------- | -------- | ------------------------------- |
| id_cliente | INT (PK) | Identificador único del cliente |
| nombre     | VARCHAR  | Nombre del cliente              |
| email      | VARCHAR  | Correo electrónico              |
| telefono   | VARCHAR  | Teléfono                        |
| direccion  | VARCHAR  | Dirección                       |
| empresa    | VARCHAR  | Empresa                         |

---

### 3.2 Tabla Proyecto

| Campo        | Tipo     | Descripción                |
| ------------ | -------- | -------------------------- |
| id_proyecto  | INT (PK) | Identificador del proyecto |
| nombre       | VARCHAR  | Nombre del proyecto        |
| fecha_inicio | DATE     | Fecha de inicio            |
| fecha_fin    | DATE     | Fecha de fin               |
| id_cliente   | INT (FK) | Cliente asociado           |
| descripcion  | TEXT     | Descripción                |
| presupuesto  | DECIMAL  | Presupuesto                |
| estado       | VARCHAR  | Estado del proyecto        |

---

### 3.3 Tabla Departamento

| Campo           | Tipo     | Descripción                    |
| --------------- | -------- | ------------------------------ |
| id_departamento | INT (PK) | Identificador del departamento |
| nombre          | VARCHAR  | Nombre                         |
| ubicacion       | VARCHAR  | Ubicación                      |

---

### 3.4 Tabla Empleado

| Campo           | Tipo     | Descripción                |
| --------------- | -------- | -------------------------- |
| id_empleado     | INT (PK) | Identificador del empleado |
| nombre          | VARCHAR  | Nombre                     |
| email           | VARCHAR  | Correo                     |
| id_departamento | INT (FK) | Departamento               |
| telefono        | VARCHAR  | Teléfono                   |
| puesto          | VARCHAR  | Puesto                     |

---

### 3.5 Tabla Incidencia

| Campo          | Tipo     | Descripción       |
| -------------- | -------- | ----------------- |
| id_incidencia  | INT (PK) | Identificador     |
| descripcion    | TEXT     | Descripción       |
| estado         | VARCHAR  | Estado            |
| id_proyecto    | INT (FK) | Proyecto asociado |
| fecha_creacion | DATE     | Fecha             |
| prioridad      | VARCHAR  | Prioridad         |

---

### 3.6 Tabla Empleado_Incidencia

Tabla intermedia que resuelve la relación N:M entre empleados e incidencias.

| Campo            | Tipo     | Descripción         |
| ---------------- | -------- | ------------------- |
| id_empleado      | INT (FK) | Empleado            |
| id_incidencia    | INT (FK) | Incidencia          |
| fecha_asignacion | DATE     | Fecha de asignación |

**Clave primaria compuesta:**

* (id_empleado, id_incidencia)

---

### 3.7 Tabla Empleado_Proyecto

Tabla intermedia que representa la asignación de empleados a proyectos.

| Campo            | Tipo     | Descripción        |
| ---------------- | -------- | ------------------ |
| id_empleado      | INT (FK) | Empleado           |
| id_proyecto      | INT (FK) | Proyecto           |
| rol              | VARCHAR  | Rol en el proyecto |
| fecha_asignacion | DATE     | Fecha              |

**Clave primaria compuesta:**

* (id_empleado, id_proyecto)

---

## 4. Relaciones entre tablas

Las relaciones del sistema son:

* Cliente (1) → (N) Proyecto
* Proyecto (1) → (N) Incidencia
* Departamento (1) → (N) Empleado
* Empleado (N) → (M) Incidencia (mediante tabla intermedia)
* Empleado (N) → (M) Proyecto (mediante tabla intermedia)

---

## 5. Integridad referencial

Se garantiza la integridad referencial mediante claves foráneas:

* Proyecto.id_cliente → Cliente.id_cliente
* Empleado.id_departamento → Departamento.id_departamento
* Incidencia.id_proyecto → Proyecto.id_proyecto
* Empleado_Incidencia.id_empleado → Empleado.id_empleado
* Empleado_Incidencia.id_incidencia → Incidencia.id_incidencia
* Empleado_Proyecto.id_empleado → Empleado.id_empleado
* Empleado_Proyecto.id_proyecto → Proyecto.id_proyecto

---

## 6. Conclusión

El diseño relacional obtenido permite representar de forma coherente la estructura de datos de la empresa.

Este modelo está preparado para su implementación en SQL, garantizando la integridad de los datos y facilitando futuras consultas y ampliaciones del sistema.
