-- Crear tabla de carnés
CREATE TABLE carnes (
    estudiante_id INT PRIMARY KEY REFERENCES estudiantes(estudiante_id),
    numero_carnet VARCHAR(10) UNIQUE NOT NULL
);

-- Insertar carnés
INSERT INTO carnes (estudiante_id, numero_carnet) VALUES
(1, 'C2023001'),
(2, 'C2023002'),
(3, 'C2023003'),
(4, 'C2023004');
