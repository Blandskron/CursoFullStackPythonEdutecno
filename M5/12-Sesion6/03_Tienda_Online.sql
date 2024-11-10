-- Crear base de datos
CREATE DATABASE tienda_online;
\c tienda_online;  -- Conectar a la base de datos tienda_online

-- Crear una secuencia automática para el número de pedido
CREATE SEQUENCE numero_pedido_seq
    START 5000         -- Comienza en 5000
    INCREMENT BY 1     -- Incremento de 1
    NO CYCLE;

-- Crear una secuencia manual para el número de factura
CREATE SEQUENCE numero_factura_seq
    START 1000         -- Comienza en 1000
    INCREMENT BY 100   -- Incremento de 100
    CYCLE;             -- La secuencia reinicia cuando llega al valor máximo

-- Tabla productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    numero_pedido INT DEFAULT nextval('numero_pedido_seq'),  -- Usar secuencia automática
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0),
    total NUMERIC(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla facturas
CREATE TABLE facturas (
    factura_id SERIAL PRIMARY KEY,
    numero_factura INT DEFAULT nextval('numero_factura_seq'), -- Usar secuencia manual para factura
    pedido_id INT REFERENCES pedidos(pedido_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar productos en la tabla productos
INSERT INTO productos (nombre, precio) VALUES 
    ('Camiseta', 20.00),
    ('Pantalón', 40.00),
    ('Zapatos', 60.00);

-- Insertar un pedido y calcular el total basado en la cantidad y el precio del producto
INSERT INTO pedidos (producto_id, cantidad, total) 
VALUES (1, 3, (SELECT precio FROM productos WHERE producto_id = 1) * 3);

-- Generar una factura para el pedido usando la secuencia de número de factura
INSERT INTO facturas (pedido_id) VALUES (1);

-- Consulta para ver el número de pedido, el número de factura y el total
SELECT p.numero_pedido, f.numero_factura, p.total, f.fecha
FROM pedidos p
JOIN facturas f ON p.pedido_id = f.pedido_id;
