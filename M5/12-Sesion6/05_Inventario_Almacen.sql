-- Crear base de datos
CREATE DATABASE inventario_almacen;
\c inventario_almacen;  -- Conectar a la base de datos inventario_almacen

-- Crear una secuencia automática para el número de lote del producto
CREATE SEQUENCE numero_lote_seq
    START 200           -- Comienza en 200
    INCREMENT BY 1      -- Incremento de 1
    NO CYCLE;

-- Crear una secuencia para números de orden de salida, usada manualmente
CREATE SEQUENCE numero_orden_salida_seq
    START 1000         -- Comienza en 1000
    INCREMENT BY 10;   -- Incremento de 10

-- Tabla productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT CHECK (cantidad >= 0),
    numero_lote INT DEFAULT nextval('numero_lote_seq')  -- Usar secuencia automática
);

-- Tabla salidas
CREATE TABLE salidas (
    salida_id SERIAL PRIMARY KEY,
    numero_orden_salida INT DEFAULT nextval('numero_orden_salida_seq'), -- Usar secuencia manualmente
    producto_id INT REFERENCES productos(producto_id),
    cantidad_salida INT CHECK (cantidad_salida > 0),
    fecha_salida DATE DEFAULT CURRENT_DATE
);

-- Insertar productos en la tabla productos usando la secuencia automática para número de lote
INSERT INTO productos (nombre, cantidad) VALUES 
    ('Producto A', 100),
    ('Producto B', 200);

-- Registrar una salida de producto usando la secuencia manualmente
INSERT INTO salidas (producto_id, cantidad_salida) 
VALUES (1, 20);

-- Consulta para ver el número de lote de cada producto y sus órdenes de salida
SELECT p.nombre AS producto, p.numero_lote, s.numero_orden_salida, s.cantidad_salida, s.fecha_salida
FROM productos p
JOIN salidas s ON p.producto_id = s.producto_id;
