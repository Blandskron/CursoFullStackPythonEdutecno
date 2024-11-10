-- Crear base de datos
CREATE DATABASE eventos_deportivos;
\c eventos_deportivos;  -- Conectar a la base de datos eventos_deportivos

-- Tabla deportistas
CREATE TABLE deportistas (
    deportista_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

-- Tabla categorias_deporte
CREATE TABLE categorias_deporte (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla eventos
CREATE TABLE eventos (
    evento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria_id INT REFERENCES categorias_deporte(categoria_id),
    fecha DATE
);

-- Tabla participaciones (relación muchos a muchos entre deportistas y eventos)
CREATE TABLE participaciones (
    participacion_id SERIAL PRIMARY KEY,
    deportista_id INT REFERENCES deportistas(deportista_id),
    evento_id INT REFERENCES eventos(evento_id),
    posicion INT CHECK (posicion > 0)
);

-- Insertar datos en la tabla deportistas
INSERT INTO deportistas (nombre, pais) VALUES 
    ('Miguel Sanchez', 'Argentina'),
    ('Carlos Ortega', 'España'),
    ('Sofia Perez', 'México');

-- Insertar datos en la tabla categorias_deporte
INSERT INTO categorias_deporte (nombre) VALUES 
    ('Atletismo'),
    ('Natación'),
    ('Ciclismo');

-- Insertar datos en la tabla eventos
INSERT INTO eventos (nombre, categoria_id, fecha) VALUES 
    ('100 metros planos', 1, '2023-05-01'),
    ('200 metros estilo libre', 2, '2023-05-10'),
    ('Carrera de montaña', 3, '2023-06-01');

-- Insertar datos en la tabla participaciones
INSERT INTO participaciones (deportista_id, evento_id, posicion) VALUES 
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3);

-- EJEMPLOS DE OPERACIONES ENTRE TABLAS

-- 1. Unión: Lista combinada de todos los deportistas y nombres de eventos
SELECT deportista_id AS id, nombre, 'Deportista' AS tipo FROM deportistas
UNION
SELECT evento_id AS id, nombre, 'Evento' AS tipo FROM eventos;

-- 2. Intersección: Deportistas que han participado en "100 metros planos" y en otro evento
SELECT d.nombre, d.pais
FROM deportistas d
JOIN participaciones p1 ON d.deportista_id = p1.deportista_id
JOIN eventos e1 ON p1.evento_id = e1.evento_id AND e1.nombre = '100 metros planos'
JOIN participaciones p2 ON d.deportista_id = p2.deportista_id
JOIN eventos e2 ON p2.evento_id = e2.evento_id AND e2.nombre <> '100 metros planos';

-- 3. Diferencia: Deportistas que NO han participado en "200 metros estilo libre"
SELECT nombre, pais 
FROM deportistas
WHERE deportista_id NOT IN (
    SELECT deportista_id
    FROM participaciones p
    JOIN eventos e ON p.evento_id = e.evento_id
    WHERE e.nombre = '200 metros estilo libre'
);

-- 4. Producto Cartesiano: Combinación de todos los deportistas y eventos para posibles participaciones
SELECT d.nombre AS deportista, e.nombre AS evento
FROM deportistas d, eventos e;

-- TIPOS DE RELACIONES

-- Relación Uno a Uno: Agregar una tabla `biografias` con una relación uno a uno con `deportistas`
CREATE TABLE biografias (
    biografia_id SERIAL PRIMARY KEY,
    deportista_id INT UNIQUE REFERENCES deportistas(deportista_id),
    descripcion TEXT
);

-- Insertar datos en la tabla biografias
INSERT INTO biografias (deportista_id, descripcion) VALUES 
    (1, 'Campeón nacional en su categoría'),
    (2, 'Recordista en natación de estilo libre');

-- Relación Uno a Varios: Eventos de la misma categoría
SELECT e.nombre AS evento, c.nombre AS categoria
FROM eventos e
JOIN categorias_deporte c ON e.categoria_id = c.categoria_id;

-- Relación Muchos a Muchos: Deportistas y eventos a través de la tabla `participaciones`
SELECT d.nombre AS deportista, e.nombre AS evento, p.posicion
FROM deportistas d
JOIN participaciones p ON d.deportista_id = p.deportista_id
JOIN eventos e ON p.evento_id = e.evento_id;

-- Relación Indeterminada: Deportistas sin participaciones registradas
SELECT d.nombre AS deportista, e.nombre AS evento
FROM deportistas d
LEFT JOIN participaciones p ON d.deportista_id = p.deportista_id
LEFT JOIN eventos e ON p.evento_id = e.evento_id
WHERE p.participacion_id IS NULL;
