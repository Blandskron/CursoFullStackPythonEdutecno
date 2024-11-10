-- Archivo: biblioteca_secuencias.sql
-- Base de datos: Biblioteca

-- Crear base de datos
CREATE DATABASE biblioteca;
\c biblioteca;  -- Conectar a la base de datos biblioteca

-- Tabla autores
CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla libros
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT REFERENCES autores(autor_id),
    genero VARCHAR(50),
    año_publicacion INT CHECK (año_publicacion > 0),
    stock INT DEFAULT 0 CHECK (stock >= 0)
);

-- Crear una secuencia personalizada para los números de préstamo
CREATE SEQUENCE numero_prestamo_seq
    START 1000          -- Comienza en 1000
    INCREMENT BY 5      -- Incremento de 5 por cada préstamo
    MINVALUE 1000       -- Valor mínimo
    MAXVALUE 9999       -- Valor máximo antes de reiniciar
    CYCLE;              -- La secuencia reinicia cuando llega al valor máximo

-- Tabla prestamos
CREATE TABLE prestamos (
    prestamo_id SERIAL PRIMARY KEY,
    numero_prestamo INT DEFAULT nextval('numero_prestamo_seq'),  -- Usar secuencia personalizada
    libro_id INT REFERENCES libros(libro_id),
    fecha_prestamo DATE DEFAULT CURRENT_DATE,
    fecha_devolucion DATE,
    usuario VARCHAR(100)
);

-- Insertar datos iniciales
INSERT INTO autores (nombre, nacionalidad) VALUES 
    ('Gabriel García Márquez', 'Colombiano'),
    ('Isabel Allende', 'Chilena');

INSERT INTO libros (titulo, autor_id, genero, año_publicacion, stock) VALUES 
    ('Cien años de soledad', 1, 'Novela', 1967, 5),
    ('La casa de los espíritus', 2, 'Novela', 1982, 3);

-- TRANSACCIONES Y PROPIEDADES ACID

-- Ejemplo de transacción para realizar un préstamo
BEGIN;

-- Verificar stock del libro
DO $$
DECLARE
    stock_actual INT;
BEGIN
    SELECT stock INTO stock_actual FROM libros WHERE libro_id = 1;

    IF stock_actual > 0 THEN
        -- Realizar el préstamo y reducir el stock
        INSERT INTO prestamos (libro_id, usuario) VALUES (1, 'Juan Perez');
        UPDATE libros SET stock = stock - 1 WHERE libro_id = 1;
        
        COMMIT;
    ELSE
        RAISE NOTICE 'Stock insuficiente para realizar el préstamo.';
        ROLLBACK;
    END IF;
END $$;

-- DCL (CONTROL DE ACCESO)

-- Crear rol para bibliotecario con permisos completos
CREATE ROLE bibliotecario;

-- Otorgar permisos completos en todas las tablas al bibliotecario
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO bibliotecario;

-- Crear rol para usuarios con permisos limitados
CREATE ROLE lector;

-- Otorgar permisos de solo lectura para libros y autores
GRANT SELECT ON libros, autores TO lector;

-- Revocar permisos de modificación en la tabla préstamos para el rol lector
REVOKE INSERT, UPDATE, DELETE ON prestamos FROM lector;

-- TCL (LENGUAJE DE CONTROL TRANSACCIONAL)

-- Transacción para devolver un libro y actualizar el stock
BEGIN;

-- Actualizar la fecha de devolución en el préstamo y aumentar el stock
UPDATE prestamos SET fecha_devolucion = CURRENT_DATE WHERE numero_prestamo = 1000;
UPDATE libros SET stock = stock + 1 WHERE libro_id = (SELECT libro_id FROM prestamos WHERE numero_prestamo = 1000);

COMMIT;

-- CONSULTAS ADICIONALES

-- Consultar el total de préstamos realizados
SELECT COUNT(*) AS total_prestamos FROM prestamos;

-- Consultar libros con stock bajo
SELECT titulo, stock FROM libros WHERE stock < 2;

-- Consultar préstamos activos (sin fecha de devolución)
SELECT numero_prestamo, titulo, usuario, fecha_prestamo 
FROM prestamos
JOIN libros ON prestamos.libro_id = libros.libro_id
WHERE fecha_devolucion IS NULL;

-- Consultar todos los autores y sus libros
SELECT a.nombre AS autor, l.titulo AS libro, l.genero, l.año_publicacion
FROM autores a
JOIN libros l ON a.autor_id = l.autor_id;

-- Fin del archivo SQL para biblioteca
