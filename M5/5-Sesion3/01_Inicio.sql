-- Lenguaje SQL (Structured Query Language)

-- Consulta Simple:
SELECT nombre, edad FROM empleados WHERE departamento = 'Ventas';

-- Insertar un nuevo registro:
INSERT INTO empleados (nombre, edad, departamento) VALUES ('Ana', 30, 'Marketing');

-- Actualizar Datos Existentes:
UPDATE empleados SET edad = 31 WHERE nombre = 'Ana';

-- Tipos de Sentencias SQL

-- Sentencia de Manipulación de Datos (DML):
DELETE FROM empleados WHERE edad > 65;

-- Crear tabla (DDL):
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio NUMERIC(10, 2)
);

-- Modificar la estructura de la tabla:
ALTER TABLE productos ADD COLUMN descripcion TEXT;

-- Tipo de Dato

-- Definición de una tabla con varios tipos de datos:
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono CHAR(10),
    fecha_registro DATE
);

--Uso de tipos numéricos:
CREATE TABLE transacciones (
    trans_id INT PRIMARY KEY,
    monto NUMERIC(10, 2),
    fecha DATE
);

-- Uso de tipos de cadena:
INSERT INTO clientes (id, nombre, telefono, fecha_registro) VALUES (1, 'Carlos', '1234567890', '2023-10-01');

-- Claves Primarias y Foráneas

-- Definir Clave Primaria:
CREATE TABLE departamentos (
    dept_id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Definir Clave Foránea:
CREATE TABLE proyectos (
    proyecto_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departamentos(dept_id)
);

-- Unir dos tablas usando claves:
SELECT proyectos.nombre, departamentos.nombre
FROM proyectos
JOIN departamentos ON proyectos.dept_id = departamentos.dept_id;

-- Consultar Datos de la Base de Datos

-- Consulta avanzada con JOIN:
SELECT empleados.nombre, departamentos.nombre 
FROM empleados 
JOIN departamentos ON empleados.dept_id = departamentos.dept_id;

-- Consulta utilizando funciones de agregado:
SELECT AVG(edad) FROM empleados WHERE departamento = 'Tecnología';

-- Consulta para obtener datos ordenados:
SELECT nombre FROM empleados ORDER BY edad DESC;

-- Insertar, Modificar y Borrar Datos

-- Insertar múltiples filas:
INSERT INTO productos (id, nombre, precio) VALUES 
(1, 'Producto A', 10.99),
(2, 'Producto B', 12.49);

-- Modificar datos condicionalmente:
UPDATE productos SET precio = precio * 1.10 WHERE nombre = 'Producto A';

-- Borrar datos según condición:
DELETE FROM productos WHERE precio < 5.00;

-- Crear, Modificar y Borrar Objetos de la Base de Datos

-- Crear un índice para mejorar el rendimiento de búsqueda:
CREATE INDEX idx_empleado_nombre ON empleados(nombre);

-- Modificar un objeto de la base de datos:
ALTER TABLE empleados DROP COLUMN telefono;

-- Eliminar un objeto de la base de datos:
DROP TABLE antiguos_empleados;

-- Controlar el Acceso a la Información

-- Crear un usuario:
CREATE USER report_viewer WITH PASSWORD 'securePassword123';

-- Conceder privilegios de solo lectura:
GRANT SELECT ON empleados TO report_viewer;

-- Revocar privilegios:
REVOKE SELECT ON empleados FROM report_viewer;

-- Garantizar la Consistencia de los Datos

-- Inicio y Confirmación de una Transacción:
BEGIN;
INSERT INTO transacciones (trans_id, monto, fecha) VALUES (1, 100.00, '2023-10-01');
COMMIT;

-- Transacción con opción de reversión:
BEGIN;
UPDATE cuentas SET saldo = saldo - 100.00 WHERE cliente_id = 1;
ROLLBACK;

-- Uso de transacciones para múltiples operaciones:
BEGIN;
INSERT INTO cuentas (cliente_id, saldo) VALUES (2, 500.00);
UPDATE cuentas SET saldo = saldo - 50.00 WHERE cliente_id = 1;
COMMIT;

-- Gestionar SGBDR

-- Creación de un esquema:
CREATE SCHEMA inventario;

-- Crear un rol para el acceso:
CREATE ROLE db_user_role;

-- Asignar un rol a un usuario:
GRANT db_user_role TO db_user;

