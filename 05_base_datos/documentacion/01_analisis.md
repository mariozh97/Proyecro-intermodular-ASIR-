# 01_analisis.md

## 1. Descripción de la empresa

La empresa simulada se dedica al desarrollo de software a medida y al mantenimiento de aplicaciones para clientes. Su actividad principal consiste en analizar necesidades, desarrollar soluciones tecnológicas y dar soporte a los sistemas implantados.

Para llevar a cabo estas tareas, la empresa necesita gestionar información relacionada con clientes, proyectos, empleados e incidencias.

---

## 2. Necesidades del sistema

La base de datos debe cubrir las siguientes necesidades:

* Almacenar información de los **clientes**
* Gestionar los **proyectos** asociados a cada cliente
* Registrar los **empleados** de la empresa
* Organizar los empleados en **departamentos**
* Controlar **incidencias o tareas** relacionadas con los proyectos
* Permitir consultas eficientes sobre la información almacenada

---

## 3. Entidades principales identificadas

| Entidad          | Descripción                              |
| ---------------- | ---------------------------------------- |
| **Cliente**      | Empresas que contratan los servicios     |
| **Proyecto**     | Trabajos desarrollados para clientes     |
| **Empleado**     | Personal de la empresa                   |
| **Departamento** | Organización interna                     |
| **Incidencia**   | Problemas o tareas asociadas a proyectos |

---

## 4. Relaciones principales

| Relación                | Tipo | Descripción                                    |
| ----------------------- | ---- | ---------------------------------------------- |
| Cliente - Proyecto      | 1:N  | Un cliente puede tener varios proyectos        |
| Proyecto - Incidencia   | 1:N  | Un proyecto puede tener varias incidencias     |
| Departamento - Empleado | 1:N  | Un departamento tiene varios empleados         |
| Empleado - Incidencia   | N:M  | Un empleado puede gestionar varias incidencias |

---

## 5. Objetivo del proyecto

El objetivo es diseñar e implementar una base de datos relacional que permita gestionar la información de la empresa de forma eficiente, organizada y segura.

---

## 6. Atributos principales por entidad

| Entidad          | Atributos clave                                                             |
| ---------------- | --------------------------------------------------------------------------- |
| **Cliente**      | id_cliente (PK), nombre, NIF, email, teléfono                               |
| **Proyecto**     | id_proyecto (PK), nombre, fecha_inicio, fecha_fin, id_cliente (FK)          |
| **Empleado**     | id_empleado (PK), nombre, email, id_departamento (FK)                       |
| **Departamento** | id_departamento (PK), nombre                                                |
| **Incidencia**   | id_incidencia (PK), descripción, estado, id_proyecto (FK), id_empleado (FK) |

