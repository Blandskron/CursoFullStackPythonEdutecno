-- Ejemplo 1: Creación de tablas relacionadas para un sistema de gestión de libros y préstamos en una biblioteca.
CREATE TABLE Libros (
    libro_id INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

CREATE TABLE Prestamos (
    prestamo_id INT PRIMARY KEY,
    libro_id INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (libro_id) REFERENCES Libros(libro_id)
);

-- Ejemplo 2: Creación de tablas relacionadas para una tienda de música.
CREATE TABLE Artistas (
    artista_id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Albumes (
    album_id INT PRIMARY KEY,
    titulo VARCHAR(100),
    fecha_lanzamiento DATE,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES Artistas(artista_id)
);

CREATE TABLE Canciones (
    cancion_id INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracion TIME,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albumes(album_id)
);
