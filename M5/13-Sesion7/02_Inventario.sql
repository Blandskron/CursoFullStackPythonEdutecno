-- Crear la base de datos
CREATE DATABASE inventario;
\c inventario;  -- Conectar a la base de datos inventario

-- Crear la tabla de productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    stock INT CHECK (stock >= 0),
    precio NUMERIC(10, 2) CHECK (precio > 0)
);

-- Crear la tabla de auditoría para registrar cambios en el stock
CREATE TABLE auditoria_productos (
    auditoria_id SERIAL PRIMARY KEY,
    producto_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    stock_anterior INT,
    stock_nuevo INT
);

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, stock, precio) VALUES
('Laptop', 50, 800.00),
('Teclado', 150, 20.00),
('Monitor', 75, 150.00);

-- Crear la función que registra los cambios en la auditoría
CREATE OR REPLACE FUNCTION registrar_cambio_stock()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en la tabla de auditoría cada vez que se actualice el stock
    INSERT INTO auditoria_productos (producto_id, stock_anterior, stock_nuevo)
    VALUES (OLD.producto_id, OLD.stock, NEW.stock);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para que se active después de una actualización en la tabla productos
CREATE TRIGGER trigger_cambio_stock
AFTER UPDATE OF stock ON productos
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_stock();

-- Actualizar el stock de un producto
UPDATE productos SET stock = 60 WHERE producto_id = 1;

-- Verificar el contenido de la tabla de auditoría
SELECT * FROM auditoria_productos;
