USE empresa;

-- =====================
-- LIMPIEZA SEGURA
-- =====================
DELETE FROM empleado_incidencia;
DELETE FROM empleado_proyecto;
DELETE FROM incidencia;
DELETE FROM proyecto;
DELETE FROM empleado;
DELETE FROM departamento;
DELETE FROM cliente;

-- =====================
-- CLIENTES
-- =====================
INSERT INTO cliente (nombre, email, telefono, direccion, empresa) VALUES
('TechSolutions SL', '[info@techsolutions.com](mailto:info@techsolutions.com)', '912345678', 'Madrid', 'TechSolutions'),
('DataCorp SA', '[contacto@datacorp.es](mailto:contacto@datacorp.es)', '934567890', 'Barcelona', 'DataCorp'),
('SoftInnovation', '[hola@softinnovation.com](mailto:hola@softinnovation.com)', '955123456', 'Valencia', 'SoftInnovation');

-- =====================
-- DEPARTAMENTOS
-- =====================
INSERT INTO departamento (nombre, ubicacion) VALUES
('Desarrollo', 'Planta 1'),
('Soporte', 'Planta 2'),
('Administración', 'Planta baja'),
('Formación', 'Planta 2');

-- =====================
-- EMPLEADOS
-- =====================
INSERT INTO empleado (nombre, email, id_departamento, telefono, puesto) VALUES
('Mario García', '[mario.garcia@empresa.com](mailto:mario.garcia@empresa.com)', 1, '611111111', 'Desarrollador'),
('Laura Martínez', '[laura.martinez@empresa.com](mailto:laura.martinez@empresa.com)', 1, '611111112', 'Frontend'),
('Carlos López', '[carlos.lopez@empresa.com](mailto:carlos.lopez@empresa.com)', 1, '611111113', 'Backend'),
('Pedro Sánchez', '[pedro.sanchez@empresa.com](mailto:pedro.sanchez@empresa.com)', 2, '611111114', 'Soporte'),
('Lucía Gómez', '[lucia.gomez@empresa.com](mailto:lucia.gomez@empresa.com)', 2, '611111115', 'Soporte'),
('Ana Fernández', '[ana.fernandez@empresa.com](mailto:ana.fernandez@empresa.com)', 1, '611111116', 'Desarrolladora'),
('Javier Ruiz', '[javier.ruiz@empresa.com](mailto:javier.ruiz@empresa.com)', 2, '611111117', 'Coordinador Soporte'),
('Elena Díaz', '[elena.diaz@empresa.com](mailto:elena.diaz@empresa.com)', 3, '611111118', 'Administrativa'),
('Sofía Torres', '[sofia.torres@empresa.com](mailto:sofia.torres@empresa.com)', 4, '611111119', 'Formadora');

-- =====================
-- PROYECTOS
-- =====================
INSERT INTO proyecto (nombre, id_cliente, descripcion, presupuesto, estado, fecha_inicio, fecha_fin) VALUES
('Web Corporativa', 1, 'Desarrollo web', 5000, 'En curso', '2024-01-01', '2024-06-01'),
('App Móvil', 1, 'Aplicación móvil', 8000, 'Planificación', '2024-02-01', '2024-08-01'),
('ERP Interno', 2, 'Sistema ERP', 12000, 'En curso', '2024-03-01', '2024-12-01');

-- =====================
-- INCIDENCIAS
-- =====================
INSERT INTO incidencia (descripcion, id_proyecto, prioridad) VALUES
('Error login', 1, 'Alta'),
('App no carga', 2, 'Media'),
('Fallo en informes', 3, 'Alta'),
('La web es lenta', 1, 'Media'),
('Error en exportación', 3, 'Baja');

-- =====================
-- RELACIÓN EMPLEADO-PROYECTO
-- =====================
INSERT INTO empleado_proyecto (id_empleado, id_proyecto, rol, fecha_asignacion) VALUES
(1, 1, 'Líder', CURRENT_DATE),
(2, 1, 'Frontend', CURRENT_DATE),
(3, 1, 'Backend', CURRENT_DATE),
(1, 2, 'Desarrollador', CURRENT_DATE),
(4, 3, 'Soporte', CURRENT_DATE),
(6, 2, 'Desarrolladora', CURRENT_DATE),
(5, 3, 'Soporte', CURRENT_DATE);

-- =====================
-- RELACIÓN EMPLEADO-INCIDENCIA
-- =====================
INSERT INTO empleado_incidencia (id_empleado, id_incidencia, fecha_asignacion) VALUES
(1, 1, CURRENT_DATE),
(2, 1, CURRENT_DATE),
(4, 2, CURRENT_DATE),
(5, 3, CURRENT_DATE),
(1, 4, CURRENT_DATE),
(3, 5, CURRENT_DATE);

-- =====================
-- VERIFICACIÓN
-- =====================
SELECT 'clientes' AS tabla, COUNT(*) AS total FROM cliente UNION
SELECT 'departamentos', COUNT(*) FROM departamento UNION
SELECT 'empleados', COUNT(*) FROM empleado UNION
SELECT 'proyectos', COUNT(*) FROM proyecto UNION
SELECT 'incidencias', COUNT(*) FROM incidencia UNION
SELECT 'empleado_proyecto', COUNT(*) FROM empleado_proyecto UNION
SELECT 'empleado_incidencia', COUNT(*) FROM empleado_incidencia;
