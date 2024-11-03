-- Crear un esquema para gestionar una base de datos de un hospital
CREATE SCHEMA hospital;

-- Crear una tabla de pacientes con diferentes tipos de datos y configurar la clave primaria
CREATE TABLE hospital.pacientes (
    paciente_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada paciente
    nombre VARCHAR(100) NOT NULL, -- Nombre del paciente con un máximo de 100 caracteres
    fecha_nacimiento DATE NOT NULL, -- Fecha de nacimiento del paciente
    genero CHAR(1), -- Género del paciente con longitud fija de 1 caracter
    direccion TEXT, -- Dirección del paciente
    telefono CHAR(10) -- Teléfono con longitud fija de 10 caracteres
);

-- Crear una tabla de médicos con información relevante
CREATE TABLE hospital.medicos (
    medico_id SERIAL PRIMARY KEY, -- Identificador único y automático para cada médico
    nombre VARCHAR(100) NOT NULL, -- Nombre del médico
    especialidad VARCHAR(100) NOT NULL, -- Especialidad médica del doctor
    correo VARCHAR(100) UNIQUE, -- Correo único para el médico
    telefono CHAR(10) -- Teléfono con longitud fija de 10 caracteres
);

-- Crear una tabla de citas que vincula pacientes y médicos
CREATE TABLE hospital.citas (
    cita_id SERIAL PRIMARY KEY, -- Identificador único para cada cita
    paciente_id INT NOT NULL, -- Clave foránea referenciando al paciente
    medico_id INT NOT NULL, -- Clave foránea para referenciar al médico
    fecha_cita TIMESTAMP NOT NULL, -- Fecha y hora programadas para la cita
    estado VARCHAR(20) NOT NULL, -- Estado de la cita (e.g., programada, completada, cancelada)
    FOREIGN KEY (paciente_id) REFERENCES hospital.pacientes (paciente_id), -- Relación con tabla pacientes
    FOREIGN KEY (medico_id) REFERENCES hospital.medicos (medico_id) -- Relación con tabla médicos
);

-- Insertar algunos pacientes en la tabla de pacientes
INSERT INTO hospital.pacientes (nombre, fecha_nacimiento, genero, direccion, telefono) VALUES
('María Perez', '1985-06-15', 'F', '789 Calle Principal', '1234567890'),
('Juan Rodríguez', '1990-09-20', 'M', '987 Avenida Central', '0987654321');

-- Insertar médicos en la tabla de médicos
INSERT INTO hospital.medicos (nombre, especialidad, correo, telefono) VALUES
('Dr. González', 'Cardiología', 'gonzalez@hospital.com', '1122334455'),
('Dra. López', 'Pediatría', 'lopez@hospital.com', '2233445566');

-- Registrar una cita, vinculando pacientes y médicos
INSERT INTO hospital.citas (paciente_id, medico_id, fecha_cita, estado) VALUES
(1, 1, '2023-12-01 10:00', 'programada');

-- Consultar los detalles de las citas por paciente específico
SELECT p.nombre AS Paciente, m.nombre AS Medico, c.fecha_cita AS Fecha, c.estado AS Estado
FROM hospital.citas c
JOIN hospital.pacientes p ON c.paciente_id = p.paciente_id
JOIN hospital.medicos m ON c.medico_id = m.medico_id
WHERE p.nombre = 'María Perez';

-- Actualizar el estado de una cita
UPDATE hospital.citas SET estado = 'completada' WHERE cita_id = 1;

-- Borrar un paciente, lo cual eliminará en cascada sus citas si configurado (requiere ON DELETE CASCADE)
ALTER TABLE hospital.citas DROP CONSTRAINT citas_paciente_id_fkey;
ALTER TABLE hospital.citas ADD CONSTRAINT citas_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES hospital.pacientes (paciente_id) ON DELETE CASCADE;
DELETE FROM hospital.pacientes WHERE paciente_id = 2;

-- Crear un índice para acelerar búsquedas en la tabla de médicos
CREATE INDEX idx_medico_nombre ON hospital.medicos (nombre);

-- Crear un usuario con permisos específicos
CREATE USER administrador WITH PASSWORD 'SecurePass2023';

-- Conceder permisos específicos al usuario para leer datos de pacientes
GRANT SELECT ON hospital.pacientes TO administrador;

-- Crear un rol para la gestión de citas
CREATE ROLE gestion_citas;

-- Conceder privilegios de inserción y actualización a la tabla de citas al rol de gestión
GRANT INSERT, UPDATE ON hospital.citas TO gestion_citas;

-- Eliminar esquema junto con todas las tablas del esquema
DROP SCHEMA IF EXISTS hospital CASCADE;