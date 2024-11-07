-- Crear la tabla con restricciones adicionales
CREATE TABLE Libros (
    id INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100),
    publicado INT CHECK (publicado >= 1500 AND publicado <= 2024),  -- Asegura que el año sea razonable
    genero VARCHAR(50),
    cantidad INT CHECK (cantidad >= 0)
);
