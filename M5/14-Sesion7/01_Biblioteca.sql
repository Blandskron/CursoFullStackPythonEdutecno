-- Archivo: biblioteca_auditoria.sql
-- Base de datos: Biblioteca con Trigger de Auditoría

-- Crear la base de datos
CREATE DATABASE biblioteca;
\c biblioteca;  -- Conectar a la base de datos biblioteca

-- Tabla libros para gestionar el inventario de libros en la biblioteca
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100),
    stock INT CHECK (stock >= 0),
    precio NUMERIC(10, 2) CHECK (precio > 0)
);

-- Tabla auditoria_libros para registrar cambios en el inventario de libros
CREATE TABLE auditoria_libros (
    auditoria_id SERIAL PRIMARY KEY,
    libro_id INT NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    stock_anterior INT,
    stock_nuevo INT
);

-- Insertar algunos libros en la tabla libros
INSERT INTO libros (titulo, autor, stock, precio) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 30, 20.00),
('1984', 'George Orwell', 50, 15.00),
('Orgullo y prejuicio', 'Jane Austen', 20, 10.00);

-- Crear la función para registrar cambios de stock en la tabla auditoria_libros
CREATE OR REPLACE FUNCTION registrar_cambio_stock_libro()
RETURNS TRIGGER AS $$
BEGIN
    -- Insertar un registro en auditoría cuando el stock cambia
    INSERT INTO auditoria_libros (libro_id, stock_anterior, stock_nuevo)
    VALUES (OLD.libro_id, OLD.stock, NEW.stock);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para activar la función después de actualizar el stock en la tabla libros
CREATE TRIGGER trigger_cambio_stock_libro
AFTER UPDATE OF stock ON libros
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_stock_libro();

-- Prueba del trigger: actualizar el stock de un libro
UPDATE libros SET stock = 25 WHERE libro_id = 1;

-- Verificar la tabla de auditoría para confirmar el registro del cambio
SELECT * FROM auditoria_libros;
