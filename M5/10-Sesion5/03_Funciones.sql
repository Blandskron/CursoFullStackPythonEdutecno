-- Archivo: hospital_funciones.sql
-- Base de datos: Hospital

-- Crear base de datos
CREATE DATABASE hospital_funciones;
\c hospital_funciones;  -- Conectar a la base de datos hospital_funciones

-- Tabla doctores
CREATE TABLE doctores (
    doctor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50),
    salario NUMERIC(10, 2) NOT NULL CHECK (salario > 0)
);

-- Tabla pacientes
CREATE TABLE pacientes (
    paciente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT CHECK (edad > 0),
    genero CHAR(1),
    direccion VARCHAR(100)
);

-- Tabla citas
CREATE TABLE citas (
    cita_id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctores(doctor_id),
    paciente_id INT REFERENCES pacientes(paciente_id),
    fecha DATE NOT NULL,
    costo NUMERIC(8, 2) NOT NULL CHECK (costo > 0)
);

-- Insertar datos de ejemplo
INSERT INTO doctores (nombre, especialidad, salario) VALUES 
    ('Dr. Juan Pérez', 'Cardiología', 70000),
    ('Dra. Ana López', 'Pediatría', 65000),
    ('Dr. Carlos Ramírez', 'Dermatología', 60000);

INSERT INTO pacientes (nombre, edad, genero, direccion) VALUES 
    ('Pedro González', 45, 'M', 'Calle Falsa 123'),
    ('Maria Torres', 30, 'F', 'Avenida Siempre Viva 456'),
    ('Luis Fernández', 20, 'M', 'Calle Luna 789');

INSERT INTO citas (doctor_id, paciente_id, fecha, costo) VALUES 
    (1, 1, '2023-01-05', 150.00),
    (1, 2, '2023-01-10', 200.00),
    (2, 3, '2023-02-12', 180.00),
    (3, 1, '2023-03-18', 250.00),
    (2, 2, '2023-04-20', 300.00);

-- CONSULTAS CON FUNCIONES AGREGADAS

-- 1. SUM() - Total de ingresos generados por todas las citas
SELECT SUM(costo) AS ingresos_totales
FROM citas;

-- 2. AVG() - Edad promedio de los pacientes
SELECT AVG(edad) AS edad_promedio
FROM pacientes;

-- 3. COUNT() - Número total de citas realizadas
SELECT COUNT(cita_id) AS total_citas
FROM citas;

-- 4. MIN() - Costo mínimo de una cita
SELECT MIN(costo) AS costo_minimo
FROM citas;

-- 5. MAX() - Costo máximo de una cita
SELECT MAX(costo) AS costo_maximo
FROM citas;

-- 6. COUNT(DISTINCT) - Número de doctores únicos en las citas
SELECT COUNT(DISTINCT doctor_id) AS total_doctores
FROM citas;

-- 7. GROUP BY y HAVING - Total de citas realizadas por cada doctor, mostrando solo aquellos con más de 1 cita
SELECT d.nombre, COUNT(c.cita_id) AS total_citas
FROM doctores d
JOIN citas c ON d.doctor_id = c.doctor_id
GROUP BY d.nombre
HAVING COUNT(c.cita_id) > 1;

-- 8. Funciones de fecha - Primera y última cita registrada
SELECT MIN(fecha) AS primera_cita, MAX(fecha) AS ultima_cita
FROM citas;

-- 9. Concatenación de cadenas - Listado de doctores con su especialidad
SELECT nombre || ' - ' || especialidad AS doctor_info
FROM doctores;

-- 10. COALESCE - Mostrar dirección de los pacientes o valor por defecto si es nula
SELECT nombre, COALESCE(direccion, 'Dirección desconocida') AS direccion
FROM pacientes;

-- 11. ROUND() - Costo promedio de las citas, redondeado a dos decimales
SELECT ROUND(AVG(costo), 2) AS costo_promedio_redondeado
FROM citas;

-- 12. Subconsulta con funciones - Doctor con el mayor número de citas
SELECT nombre
FROM doctores
WHERE doctor_id = (SELECT doctor_id FROM citas GROUP BY doctor_id ORDER BY COUNT(cita_id) DESC LIMIT 1);

-- 13. SUM() y AVG() combinados - Promedio de ingresos por cita por doctor
SELECT d.nombre, AVG(c.costo) AS promedio_ingresos
FROM doctores d
JOIN citas c ON d.doctor_id = c.doctor_id
GROUP BY d.nombre;

-- 14. CASE WHEN - Clasificación de doctores según su salario
SELECT nombre,
       CASE 
           WHEN salario < 60000 THEN 'Bajo'
           WHEN salario BETWEEN 60000 AND 70000 THEN 'Medio'
           ELSE 'Alto'
       END AS clasificacion_salario
FROM doctores;

-- 15. Generación de valores de serie - Días con citas en enero de 2023
SELECT GENERATE_SERIES('2023-01-01'::DATE, '2023-01-31'::DATE, '1 day'::INTERVAL) AS dia;

-- 16. Función SUM() con JOIN y GROUP BY - Ingresos totales por doctor
SELECT d.nombre, SUM(c.costo) AS total_ingresos
FROM doctores d
JOIN citas c ON d.doctor_id = c.doctor_id
GROUP BY d.nombre;

-- 17. COUNT() y DISTINCT - Total de días únicos con citas registradas
SELECT COUNT(DISTINCT fecha) AS dias_unicos_citas
FROM citas;

-- 18. Subconsulta con SUM() y JOIN - Ingresos totales por especialidad de doctor
SELECT d.especialidad, SUM(c.costo) AS total_ingresos_por_especialidad
FROM doctores d
JOIN citas c ON d.doctor_id = c.doctor_id
GROUP BY d.especialidad;

-- Fin del archivo SQL para hospital_funciones
