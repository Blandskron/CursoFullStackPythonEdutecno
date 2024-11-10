-- Archivo: empresa_auditoria.sql
-- Base de datos: Empresa con Trigger de Auditoría para Cambios en Salarios de Empleados

-- Crear la base de datos
CREATE DATABASE empresa;
\c empresa;  -- Conectar a la base de datos empresa

-- Tabla empleados para gestionar la información de los empleados de la empresa
CREATE TABLE empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50),
    salario NUMERIC(12, 2) CHECK (salario >= 0)
);

-- Tabla auditoria_salarios para registrar cambios en los salarios de los empleados
CREATE TABLE auditoria_salarios (
    auditoria_id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salario_anterior NUMERIC(12, 2),
    salario_nuevo NUMERIC(12, 2)
);

-- Insertar algunos empleados en la tabla empleados
INSERT INTO empleados (nombre, departamento, salario) VALUES
('Ana Morales', 'Recursos Humanos', 3500.00),
('Luis Pérez', 'Finanzas', 4200.00),
('María Sánchez', 'Marketing', 3900.00);

-- Crear la función para registrar cambios en los salarios de los empleados
CREATE OR REPLACE FUNCTION registrar_cambio_salario()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en la tabla de auditoría cuando el salario cambia
    INSERT INTO auditoria_salarios (empleado_id, salario_anterior, salario_nuevo)
    VALUES (OLD.empleado_id, OLD.salario, NEW.salario);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para activar la función después de actualizar el salario en la tabla empleados
CREATE TRIGGER trigger_cambio_salario
AFTER UPDATE OF salario ON empleados
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_salario();

-- Prueba del trigger: actualizar el salario de un empleado
UPDATE empleados SET salario = 3800.00 WHERE empleado_id = 1;

-- Verificar la tabla de auditoría para confirmar el registro del cambio
SELECT * FROM auditoria_salarios;
