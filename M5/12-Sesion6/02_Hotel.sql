-- Crear base de datos
CREATE DATABASE hotel;
\c hotel;  -- Conectar a la base de datos hotel

-- Crear una secuencia personalizada para el número de reserva
CREATE SEQUENCE numero_reserva_seq
    START 10000          -- Comienza en 10000
    INCREMENT BY 1       -- Incremento de 1
    NO CYCLE;            -- La secuencia no reinicia

-- Crear una secuencia para números de habitación, usada manualmente
CREATE SEQUENCE numero_habitacion_seq
    START 101           -- Comienza en 101
    INCREMENT BY 1;     -- Incremento de 1

-- Tabla habitaciones
CREATE TABLE habitaciones (
    habitacion_id INT DEFAULT nextval('numero_habitacion_seq'), -- Usar secuencia manualmente
    tipo VARCHAR(50),
    precio NUMERIC(8, 2) NOT NULL CHECK (precio > 0),
    PRIMARY KEY (habitacion_id)
);

-- Tabla reservas
CREATE TABLE reservas (
    reserva_id SERIAL PRIMARY KEY,
    numero_reserva INT DEFAULT nextval('numero_reserva_seq'),  -- Usar secuencia automática
    habitacion_id INT REFERENCES habitaciones(habitacion_id),
    cliente VARCHAR(100),
    fecha_reserva DATE DEFAULT CURRENT_DATE,
    noches INT CHECK (noches > 0)
);

-- Insertar datos en la tabla habitaciones usando la secuencia manualmente
INSERT INTO habitaciones (tipo, precio) VALUES 
    ('Individual', 80.00),
    ('Doble', 120.00),
    ('Suite', 250.00);

-- Insertar una reserva en la tabla reservas con la secuencia automática
INSERT INTO reservas (habitacion_id, cliente, noches) 
VALUES (nextval('numero_habitacion_seq'), 'Carlos Lopez', 3);

-- Consulta para obtener todas las reservas con el número de reserva y tipo de habitación
SELECT r.numero_reserva, r.cliente, h.tipo AS habitacion, r.noches, r.fecha_reserva
FROM reservas r
JOIN habitaciones h ON r.habitacion_id = h.habitacion_id;
