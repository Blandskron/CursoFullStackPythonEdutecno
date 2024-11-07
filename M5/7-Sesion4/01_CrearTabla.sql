-- Creación de la tabla usando DDL (Data Definition Language)
CREATE TABLE Libros (
    id INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100),
    publicado INT,
    genero VARCHAR(50),
    cantidad INT CHECK (cantidad >= 0)  -- Restricción de validación para que la cantidad sea no negativa
);
