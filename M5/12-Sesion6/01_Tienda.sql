-- Crear base de datos
CREATE DATABASE tienda;
\c tienda;  -- Conectar a la base de datos tienda

-- Crear una secuencia personalizada para generar números de venta
CREATE SEQUENCE numero_venta_seq
    START 1               -- Comienza en 1
    INCREMENT BY 1        -- Incremento de 1
    MINVALUE 1            -- Valor mínimo
    MAXVALUE 10000        -- Valor máximo antes de reiniciar
    CYCLE;                -- La secuencia reinicia cuando llega al valor máximo

-- Tabla productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0),
    stock INT DEFAULT 0 CHECK (stock >= 0)
);

-- Tabla ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    numero_venta INT DEFAULT nextval('numero_venta_seq'),  -- Usar secuencia personalizada
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0),
    total NUMERIC(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, precio, stock) VALUES 
    ('Laptop', 800.00, 10),
    ('Mouse', 25.00, 50),
    ('Teclado', 45.00, 30);

-- Insertar una venta usando la secuencia
INSERT INTO ventas (producto_id, cantidad, total) 
VALUES (1, 2, (SELECT precio FROM productos WHERE producto_id = 1) * 2);

-- Consulta básica para obtener las ventas con el número de venta y producto
SELECT v.numero_venta, p.nombre AS producto, v.cantidad, v.total, v.fecha
FROM ventas v
JOIN productos p ON v.producto_id = p.producto_id;
