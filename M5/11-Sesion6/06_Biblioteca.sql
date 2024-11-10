-- Crear base de datos
CREATE DATABASE biblioteca;
\c biblioteca;  -- Conectar a la base de datos biblioteca

-- Tabla lectores
CREATE TABLE lectores (
    lector_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT CHECK (edad > 0)
);

-- Tabla categorias
CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla libros
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria_id INT REFERENCES categorias(categoria_id)
);

-- Tabla prestamos (relación muchos a muchos entre lectores y libros)
CREATE TABLE prestamos (
    prestamo_id SERIAL PRIMARY KEY,
    lector_id INT REFERENCES lectores(lector_id),
    libro_id INT REFERENCES libros(libro_id),
    fecha_prestamo DATE DEFAULT CURRENT_DATE
);

-- Insertar datos en la tabla lectores
INSERT INTO lectores (nombre, apellido, edad) VALUES 
    ('Carlos', 'Santos', 25),
    ('Maria', 'Lopez', 30),
    ('Pedro', 'Martinez', 20);

-- Insertar datos en la tabla categorias
INSERT INTO categorias (nombre) VALUES 
    ('Novela'),
    ('Ciencia Ficción'),
    ('Historia');

-- Insertar datos en la tabla libros
INSERT INTO libros (titulo, autor, categoria_id) VALUES 
    ('1984', 'George Orwell', 2),
    ('Cien años de soledad', 'Gabriel García Márquez', 1),
    ('Breve historia del tiempo', 'Stephen Hawking', 3);

-- Insertar datos en la tabla prestamos
INSERT INTO prestamos (lector_id, libro_id) VALUES 
    (1, 1),
    (1, 2),
    (2, 3);

-- EJEMPLOS DE OPERACIONES ENTRE TABLAS

-- 1. Unión: Lista combinada de todos los lectores y títulos de libros en la biblioteca
SELECT lector_id AS id, nombre, 'Lector' AS tipo FROM lectores
UNION
SELECT libro_id AS id, titulo, 'Libro' AS tipo FROM libros;

-- 2. Intersección: Lectores que han pedido prestado tanto '1984' como 'Cien años de soledad'
SELECT l.nombre, l.apellido
FROM lectores l
JOIN prestamos p1 ON l.lector_id = p1.lector_id
JOIN libros b1 ON p1.libro_id = b1.libro_id AND b1.titulo = '1984'
JOIN prestamos p2 ON l.lector_id = p2.lector_id
JOIN libros b2 ON p2.libro_id = b2.libro_id AND b2.titulo = 'Cien años de soledad';

-- 3. Diferencia: Lectores que NO han pedido prestado el libro '1984'
SELECT nombre, apellido 
FROM lectores
WHERE lector_id NOT IN (
    SELECT lector_id
    FROM prestamos p
    JOIN libros b ON p.libro_id = b.libro_id
    WHERE b.titulo = '1984'
);

-- 4. Producto Cartesiano: Combinar cada lector con cada libro para posibles préstamos
SELECT l.nombre AS lector, b.titulo AS libro
FROM lectores l, libros b;

-- TIPOS DE RELACIONES

-- Relación Uno a Uno: Agregaremos una tabla `membresias` con relación uno a uno con `lectores`
CREATE TABLE membresias (
    membresia_id SERIAL PRIMARY KEY,
    lector_id INT UNIQUE REFERENCES lectores(lector_id),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Insertar datos en la tabla membresias
INSERT INTO membresias (lector_id, fecha_inicio, fecha_fin) VALUES 
    (1, '2023-01-01', '2024-01-01'),
    (2, '2023-05-01', '2024-05-01');

-- Relación Uno a Varios: Libros que pertenecen a la misma categoría
-- Ejemplo de consulta para mostrar todos los libros en la categoría "Novela"
SELECT b.titulo, c.nombre AS categoria
FROM libros b
JOIN categorias c ON b.categoria_id = c.categoria_id
WHERE c.nombre = 'Novela';

-- Relación Muchos a Muchos: Lectores y libros a través de la tabla `prestamos`
-- Ejemplo de consulta para mostrar todos los lectores y los libros que han prestado
SELECT l.nombre AS lector, b.titulo AS libro
FROM lectores l
JOIN prestamos p ON l.lector_id = p.lector_id
JOIN libros b ON p.libro_id = b.libro_id;

-- Relación Indeterminada: Lectores sin préstamos registrados
SELECT l.nombre AS lector, b.titulo AS libro
FROM lectores l
LEFT JOIN prestamos p ON l.lector_id = p.lector_id
LEFT JOIN libros b ON p.libro_id = b.libro_id
WHERE p.prestamo_id IS NULL;
