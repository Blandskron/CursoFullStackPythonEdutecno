-- Archivo: hospital_auditoria.sql
-- Base de datos: Hospital con Trigger de Auditoría para Cambios en el Estado de Pacientes

-- Crear la base de datos
CREATE DATABASE hospital;
\c hospital;  -- Conectar a la base de datos hospital

-- Tabla pacientes para gestionar la información de pacientes en el hospital
CREATE TABLE pacientes (
    paciente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,  -- Estado puede ser 'Activo', 'Recuperado', 'Alta', etc.
    fecha_ingreso DATE DEFAULT CURRENT_DATE
);

-- Tabla auditoria_pacientes para registrar cambios en el estado de pacientes
CREATE TABLE auditoria_pacientes (
    auditoria_id SERIAL PRIMARY KEY,
    paciente_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50)
);

-- Insertar algunos pacientes en la tabla pacientes
INSERT INTO pacientes (nombre, estado) VALUES
('Ana García', 'Activo'),
('Luis Pérez', 'Recuperado'),
('María Torres', 'Alta');

-- Crear la función para registrar cambios en el estado de los pacientes
CREATE OR REPLACE FUNCTION registrar_cambio_estado_paciente()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en la tabla de auditoría cuando el estado cambia
    INSERT INTO auditoria_pacientes (paciente_id, estado_anterior, estado_nuevo)
    VALUES (OLD.paciente_id, OLD.estado, NEW.estado);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para activar la función después de actualizar el estado en la tabla pacientes
CREATE TRIGGER trigger_cambio_estado_paciente
AFTER UPDATE OF estado ON pacientes
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_estado_paciente();

-- Prueba del trigger: actualizar el estado de un paciente
UPDATE pacientes SET estado = 'Recuperado' WHERE paciente_id = 1;

-- Verificar la tabla de auditoría para confirmar el registro del cambio
SELECT * FROM auditoria_pacientes;
