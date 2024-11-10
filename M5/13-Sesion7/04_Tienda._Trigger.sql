-- Archivo: tienda_auditoria.sql
-- Base de datos: Tienda con Trigger de Auditoría para Cambios en Precios de Productos

-- Crear la base de datos
CREATE DATABASE tienda;
\c tienda;  -- Conectar a la base de datos tienda

-- Tabla productos para gestionar los precios de los productos en la tienda
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

-- Tabla auditoria_precios para registrar cambios en los precios de los productos
CREATE TABLE auditoria_precios (
    auditoria_id SERIAL PRIMARY KEY,
    producto_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    precio_anterior NUMERIC(10, 2),
    precio_nuevo NUMERIC(10, 2)
);

-- Insertar algunos productos en la tabla productos
INSERT INTO productos (nombre, precio, stock) VALUES
('Laptop', 800.00, 20),
('Teclado', 25.00, 100),
('Monitor', 150.00, 50);

-- Crear la función para registrar cambios en el precio de los productos
CREATE OR REPLACE FUNCTION registrar_cambio_precio()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en la tabla de auditoría cuando el precio cambia
    INSERT INTO auditoria_precios (producto_id, precio_anterior, precio_nuevo)
    VALUES (OLD.producto_id, OLD.precio, NEW.precio);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para activar la función después de actualizar el precio en la tabla productos
CREATE TRIGGER trigger_cambio_precio
AFTER UPDATE OF precio ON productos
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_precio();

-- Prueba del trigger: actualizar el precio de un producto
UPDATE productos SET precio = 850.00 WHERE producto_id = 1;

-- Verificar la tabla de auditoría para confirmar el registro del cambio
SELECT * FROM auditoria_precios;
