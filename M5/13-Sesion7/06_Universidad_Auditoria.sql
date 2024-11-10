-- Archivo: universidad_auditoria.sql
-- Base de datos: Universidad con Trigger de Auditoría para Cambios en Calificaciones

-- Crear la base de datos
CREATE DATABASE universidad;
\c universidad;  -- Conectar a la base de datos universidad

-- Tabla estudiantes para gestionar información básica de estudiantes
CREATE TABLE estudiantes (
    estudiante_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL
);

-- Tabla calificaciones para almacenar las notas de cada estudiante en distintas asignaturas
CREATE TABLE calificaciones (
    calificacion_id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES estudiantes(estudiante_id),
    asignatura VARCHAR(100) NOT NULL,
    calificacion DECIMAL(5, 2) CHECK (calificacion >= 0 AND calificacion <= 100)
);

-- Tabla auditoria_calificaciones para registrar cambios en las calificaciones de estudiantes
CREATE TABLE auditoria_calificaciones (
    auditoria_id SERIAL PRIMARY KEY,
    calificacion_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    calificacion_anterior DECIMAL(5, 2),
    calificacion_nueva DECIMAL(5, 2)
);

-- Insertar algunos estudiantes en la tabla estudiantes
INSERT INTO estudiantes (nombre, apellido) VALUES
('Carlos', 'Ramírez'),
('Lucía', 'Fernández'),
('José', 'Martínez');

-- Insertar calificaciones para los estudiantes en la tabla calificaciones
INSERT INTO calificaciones (estudiante_id, asignatura, calificacion) VALUES
(1, 'Matemáticas', 85.50),
(2, 'Historia', 78.00),
(3, 'Ciencias', 92.75);

-- Crear la función para registrar cambios en las calificaciones de los estudiantes
CREATE OR REPLACE FUNCTION registrar_cambio_calificacion()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en la tabla de auditoría cuando la calificación cambia
    INSERT INTO auditoria_calificaciones (calificacion_id, calificacion_anterior, calificacion_nueva)
    VALUES (OLD.calificacion_id, OLD.calificacion, NEW.calificacion);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para activar la función después de actualizar la calificación en la tabla calificaciones
CREATE TRIGGER trigger_cambio_calificacion
AFTER UPDATE OF calificacion ON calificaciones
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_calificacion();

-- Prueba del trigger: actualizar la calificación de un estudiante
UPDATE calificaciones SET calificacion = 88.00 WHERE calificacion_id = 1;

-- Verificar la tabla de auditoría para confirmar el registro del cambio
SELECT * FROM auditoria_calificaciones;
