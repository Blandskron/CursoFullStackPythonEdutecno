-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Crear tablas "Pacientes" y "Medicos" con restricciones, valores por defecto y validación

CREATE TABLE Pacientes (
    paciente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad > 0 AND edad < 120),  -- Edad entre 1 y 119
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),   -- Solo permite 'M' o 'F'
    direccion VARCHAR(150),
    telefono VARCHAR(20) UNIQUE
);

CREATE TABLE Medicos (
    medico_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) CHECK (salario > 0),
    experiencia INT CHECK (experiencia >= 0),
    telefono VARCHAR(20) UNIQUE
);

-- Crear una tabla para Citas que relacione pacientes y médicos
CREATE TABLE Citas (
    cita_id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    paciente_id INT,
    medico_id INT,
    motivo VARCHAR(150),
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id) ON DELETE CASCADE,
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id) ON DELETE SET NULL
);

-- Crear una tabla para Tratamientos asignados en cada cita
CREATE TABLE Tratamientos (
    tratamiento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_semanas INT CHECK (duracion_semanas > 0),
    costo DECIMAL(10, 2) CHECK (costo > 0)
);

CREATE TABLE Citas_Tratamientos (
    cita_id INT,
    tratamiento_id INT,
    cantidad INT CHECK (cantidad > 0),
    FOREIGN KEY (cita_id) REFERENCES Citas(cita_id) ON DELETE CASCADE,
    FOREIGN KEY (tratamiento_id) REFERENCES Tratamientos(tratamiento_id) ON DELETE CASCADE
);

-- Crear tabla Facturacion para cada tratamiento realizado
CREATE TABLE Facturacion (
    factura_id SERIAL PRIMARY KEY,
    paciente_id INT,
    tratamiento_id INT,
    fecha DATE DEFAULT CURRENT_DATE,
    total DECIMAL(10, 2) CHECK (total >= 0),
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id) ON DELETE CASCADE,
    FOREIGN KEY (tratamiento_id) REFERENCES Tratamientos(tratamiento_id) ON DELETE CASCADE
);

-- Alterar la tabla Medicos para agregar una columna de disponibilidad
ALTER TABLE Medicos ADD COLUMN disponible BOOLEAN DEFAULT TRUE;

-- Renombrar la columna "disponible" a "activo" en la tabla Medicos
ALTER TABLE Medicos RENAME COLUMN disponible TO activo;

-- EXERCISE 2: PASANDO DE UN MODELO RELACIONAL A UNO FÍSICO
-- Establecer relaciones entre varias tablas con llaves foráneas y eliminar restricciones de integridad

-- Agregar una restricción de unicidad para evitar duplicación de citas en una misma fecha y hora
ALTER TABLE Citas
ADD CONSTRAINT unica_cita UNIQUE (fecha, hora, paciente_id);

-- Desactivar temporalmente la restricción de unicidad en citas
ALTER TABLE Citas DISABLE CONSTRAINT unica_cita;

-- Re-activar la restricción de unicidad
ALTER TABLE Citas ENABLE CONSTRAINT unica_cita;

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Insertar datos en las tablas Pacientes, Medicos, y Tratamientos

INSERT INTO Pacientes (nombre, edad, sexo, direccion, telefono)
VALUES 
    ('Juan Pérez', 35, 'M', 'Calle 1, Ciudad', '+123456789'),
    ('Maria López', 29, 'F', 'Calle 2, Ciudad', '+987654321');

INSERT INTO Medicos (nombre, especialidad, salario, experiencia, telefono)
VALUES 
    ('Dr. Martínez', 'Cardiología', 5000, 10, '+123123123'),
    ('Dra. Gómez', 'Neurología', 6000, 8, '+321321321');

INSERT INTO Tratamientos (nombre, descripcion, duracion_semanas, costo)
VALUES 
    ('Fisioterapia', 'Terapia física para recuperación muscular', 6, 200),
    ('Terapia Ocupacional', 'Rehabilitación a través de actividades cotidianas', 8, 300);

-- Insertar citas entre pacientes y médicos
INSERT INTO Citas (fecha, hora, paciente_id, medico_id, motivo)
VALUES 
    ('2024-01-15', '10:00:00', 1, 1, 'Consulta de rutina'),
    ('2024-01-20', '11:30:00', 2, 2, 'Dolor de cabeza frecuente');

-- Insertar registros en Citas_Tratamientos para asignar tratamientos a las citas
INSERT INTO Citas_Tratamientos (cita_id, tratamiento_id, cantidad)
VALUES 
    (1, 1, 2),
    (2, 2, 1);

-- Generar facturación por tratamientos
INSERT INTO Facturacion (paciente_id, tratamiento_id, total)
VALUES 
    (1, 1, 400),  -- 2 sesiones de fisioterapia a 200 cada una
    (2, 2, 300);  -- 1 sesión de terapia ocupacional a 300

-- Modificar el salario de un médico en la tabla Medicos
UPDATE Medicos
SET salario = salario * 1.10  -- Aumento del 10%
WHERE especialidad = 'Cardiología';

-- Eliminar un tratamiento específico en la tabla Tratamientos
DELETE FROM Tratamientos
WHERE nombre = 'Fisioterapia';

-- Ejemplo de condicional CASE para clasificar médicos por años de experiencia
SELECT nombre, especialidad, experiencia,
    CASE 
        WHEN experiencia < 5 THEN 'Junior'
        WHEN experiencia BETWEEN 5 AND 10 THEN 'Intermedio'
        ELSE 'Senior'
    END AS nivel_experiencia
FROM Medicos;

-- Crear una vista para mostrar el historial de citas y tratamientos por paciente
CREATE VIEW Historial_Citas AS
SELECT p.nombre AS paciente, m.nombre AS medico, c.fecha, c.hora, t.nombre AS tratamiento, ct.cantidad
FROM Pacientes p
JOIN Citas c ON p.paciente_id = c.paciente_id
JOIN Medicos m ON c.medico_id = m.medico_id
JOIN Citas_Tratamientos ct ON c.cita_id = ct.cita_id
JOIN Tratamientos t ON ct.tratamiento_id = t.tratamiento_id;

-- Consultar la vista Historial_Citas
SELECT * FROM Historial_Citas;

-- Eliminar la tabla Facturacion para finalizar
DROP TABLE IF EXISTS Facturacion CASCADE;
