USE empresa;

-- =====================
-- 1. CONSULTAS BÁSICAS
-- =====================

-- Ver todos los clientes
SELECT * FROM cliente;

-- Ver empleados
SELECT * FROM empleado;

-- Ver proyectos
SELECT * FROM proyecto;

-- Ver incidencias
SELECT * FROM incidencia;

-- =====================
-- 2. RELACIONES (JOINS)
-- =====================

-- Proyectos con su cliente
SELECT p.nombre AS proyecto, c.nombre AS cliente
FROM proyecto p
JOIN cliente c ON p.id_cliente = c.id_cliente;

-- Empleados con su departamento
SELECT e.nombre AS empleado, d.nombre AS departamento
FROM empleado e
JOIN departamento d ON e.id_departamento = d.id_departamento;

-- Incidencias con su proyecto
SELECT i.descripcion, p.nombre AS proyecto, i.estado
FROM incidencia i
JOIN proyecto p ON i.id_proyecto = p.id_proyecto;

-- =====================
-- 3. RELACIONES N:M
-- =====================

-- Empleados asignados a proyectos
SELECT e.nombre AS empleado, p.nombre AS proyecto, ep.rol
FROM empleado_proyecto ep
JOIN empleado e ON ep.id_empleado = e.id_empleado
JOIN proyecto p ON ep.id_proyecto = p.id_proyecto;

-- Empleados asignados a incidencias
SELECT e.nombre AS empleado, i.descripcion AS incidencia
FROM empleado_incidencia ei
JOIN empleado e ON ei.id_empleado = e.id_empleado
JOIN incidencia i ON ei.id_incidencia = i.id_incidencia;

-- =====================
-- 4. CONSULTAS ÚTILES 
-- =====================

-- Número de empleados por departamento
SELECT d.nombre, COUNT(e.id_empleado) AS total_empleados
FROM departamento d
LEFT JOIN empleado e ON d.id_departamento = e.id_departamento
GROUP BY d.nombre;

-- Número de incidencias por proyecto
SELECT p.nombre, COUNT(i.id_incidencia) AS total_incidencias
FROM proyecto p
LEFT JOIN incidencia i ON p.id_proyecto = i.id_proyecto
GROUP BY p.nombre;

-- Proyectos con presupuesto mayor a 6000
SELECT nombre, presupuesto
FROM proyecto
WHERE presupuesto > 6000;

-- Incidencias de alta prioridad
SELECT descripcion, prioridad
FROM incidencia
WHERE prioridad = 'Alta';

-- =====================
-- 5. CONSULTA COMPLEJA 
-- =====================

-- Ver empleados, proyectos e incidencias relacionadas
SELECT e.nombre AS empleado, p.nombre AS proyecto, i.descripcion AS incidencia
FROM empleado e
LEFT JOIN empleado_proyecto ep ON e.id_empleado = ep.id_empleado
LEFT JOIN proyecto p ON ep.id_proyecto = p.id_proyecto
LEFT JOIN incidencia i ON p.id_proyecto = i.id_proyecto;

-- =====================
-- 6. VERIFICACIÓN FINAL
-- =====================

SELECT 'clientes' AS tabla, COUNT(*) FROM cliente UNION
SELECT 'departamentos', COUNT(*) FROM departamento UNION
SELECT 'empleados', COUNT(*) FROM empleado UNION
SELECT 'proyectos', COUNT(*) FROM proyecto UNION
SELECT 'incidencias', COUNT(*) FROM incidencia UNION
SELECT 'empleado_proyecto', COUNT(*) FROM empleado_proyecto UNION
SELECT 'empleado_incidencia', COUNT(*) FROM empleado_incidencia;
