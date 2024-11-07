-- Seleccionar libros que tengan una cantidad mayor a 2 y género 'Distopia'
SELECT * FROM Libros
WHERE cantidad > 2 AND genero = 'Distopia';

-- Seleccionar libros publicados antes del año 2000
SELECT * FROM Libros
WHERE publicado < 2000;
