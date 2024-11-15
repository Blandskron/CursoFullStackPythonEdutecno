-- Crear base de datos
CREATE DATABASE hospital_pacientes;
\c hospital_pacientes;  -- Conectar a la base de datos hospital_pacientes

-- Crear una secuencia automática para el número de expediente del paciente
CREATE SEQUENCE numero_expediente_seq
    START 10000          -- Comienza en 10000
    INCREMENT BY 1       -- Incremento de 1
    NO CYCLE;            -- La secuencia no reinicia

-- Crear una secuencia para números de consulta, usada manualmente para visitas
CREATE SEQUENCE numero_consulta_seq
    START 500            -- Comienza en 500
    INCREMENT BY 5;      -- Incremento de 5

-- Tabla pacientes
CREATE TABLE pacientes (
    paciente_id SERIAL PRIMARY KEY,
    numero_expediente INT DEFAULT nextval('numero_expediente_seq'),  -- Usar secuencia automática
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad > 0),
    genero CHAR(1) CHECK (genero IN ('M', 'F')),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla visitas
CREATE TABLE visitas (
    visita_id SERIAL PRIMARY KEY,
    numero_consulta INT DEFAULT nextval('numero_consulta_seq'),  -- Usar secuencia manualmente
    paciente_id INT REFERENCES pacientes(paciente_id),
    fecha_visita DATE DEFAULT CURRENT_DATE,
    motivo VARCHAR(255)
);

-- Insertar datos en la tabla pacientes
INSERT INTO pacientes (nombre, edad, genero) VALUES 
    ('Ana García', 30, 'F'),
    ('Luis Ramírez', 40, 'M');

-- Insertar una visita para un paciente usando la secuencia manualmente
INSERT INTO visitas (paciente_id, motivo) 
VALUES (1, 'Consulta de seguimiento');

-- Consulta para obtener el expediente de cada paciente junto con las visitas
SELECT p.numero_expediente, p.nombre AS paciente, v.numero_consulta, v.motivo, v.fecha_visita
FROM pacientes p
JOIN visitas v ON p.paciente_id = v.paciente_id;
