CREATE DATABASE empresa;
USE empresa;

-- =====================
-- CLIENTE
-- =====================
CREATE TABLE cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
telefono VARCHAR(20),
direccion VARCHAR(150),
empresa VARCHAR(100)
);

-- =====================
-- DEPARTAMENTO
-- =====================
CREATE TABLE departamento (
id_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
ubicacion VARCHAR(100)
);

-- =====================
-- EMPLEADO
-- =====================
CREATE TABLE empleado (
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
id_departamento INT,
telefono VARCHAR(20),
puesto VARCHAR(100),
FOREIGN KEY (id_departamento)
REFERENCES departamento(id_departamento)
ON DELETE SET NULL
ON UPDATE CASCADE
);

-- =====================
-- PROYECTO
-- =====================
CREATE TABLE proyecto (
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
id_cliente INT,
descripcion TEXT,
presupuesto DECIMAL(10,2) DEFAULT 0,
estado VARCHAR(50) DEFAULT 'pendiente',
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
ON DELETE SET NULL
ON UPDATE CASCADE
);

-- =====================
-- INCIDENCIA
-- =====================
CREATE TABLE incidencia (
id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
descripcion TEXT NOT NULL,
estado VARCHAR(50) DEFAULT 'abierta',
id_proyecto INT,
fecha_creacion DATE DEFAULT (CURRENT_DATE),
prioridad VARCHAR(50) DEFAULT 'media',
FOREIGN KEY (id_proyecto)
REFERENCES proyecto(id_proyecto)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- =====================
-- EMPLEADO_PROYECTO (N:M)
-- =====================
CREATE TABLE empleado_proyecto (
id_empleado INT,
id_proyecto INT,
rol VARCHAR(100) DEFAULT 'miembro',
fecha_asignacion DATE DEFAULT (CURRENT_DATE),
PRIMARY KEY (id_empleado, id_proyecto),
FOREIGN KEY (id_empleado)
REFERENCES empleado(id_empleado)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_proyecto)
REFERENCES proyecto(id_proyecto)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- =====================
-- EMPLEADO_INCIDENCIA (N:M)
-- =====================
CREATE TABLE empleado_incidencia (
id_empleado INT,
id_incidencia INT,
fecha_asignacion DATE DEFAULT (CURRENT_DATE),
PRIMARY KEY (id_empleado, id_incidencia),
FOREIGN KEY (id_empleado)
REFERENCES empleado(id_empleado)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_incidencia)
REFERENCES incidencia(id_incidencia)
ON DELETE CASCADE
ON UPDATE CASCADE
);

