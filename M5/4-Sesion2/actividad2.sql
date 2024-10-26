CREATE TABLE Tipo (
    tipo_id INT PRIMARY KEY,
    nombre_tipo VARCHAR(100) UNIQUE
);

CREATE TABLE Entrenador (
    entrenador_id INT PRIMARY KEY,
    nombre_entrenador VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE Pokemon (
    pokemon_id INT PRIMARY KEY,
    nombre_pokemon VARCHAR(100) UNIQUE,
    tipo_id INT,
    altura DECIMAL(5, 2),
    peso DECIMAL(5, 2),
    FOREIGN KEY (tipo_id) REFERENCES Tipo(tipo_id)
);

CREATE TABLE Movimiento (
    movimiento_id INT PRIMARY KEY,
    nombre_movimiento VARCHAR(100) UNIQUE,
    tipo_id INT,
    potencia INT,
    precision DECIMAL(5, 2),
    FOREIGN KEY (tipo_id) REFERENCES Tipo(tipo_id)
);

CREATE TABLE EntrenadorPokemon (
    entrenador_pokemon_id INT PRIMARY KEY,
    entrenador_id INT,
    pokemon_id INT,
    nivel INT,
    FOREIGN KEY (entrenador_id) REFERENCES Entrenador(entrenador_id),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id)
);

CREATE TABLE PokemonMovimiento (
    pokemon_movimiento_id INT PRIMARY KEY,
    pokemon_id INT,
    movimiento_id INT,
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id),
    FOREIGN KEY (movimiento_id) REFERENCES Movimiento(movimiento_id)
);

INSERT INTO Tipo (tipo_id, nombre_tipo) VALUES
(1, 'Fuego'),
(2, 'Agua'),
(3, 'Planta');

INSERT INTO Entrenador (entrenador_id, nombre_entrenador, region) VALUES
(1, 'Ash Ketchum', 'Kanto'),
(2, 'Misty', 'Kanto'),
(3, 'Brock', 'Kanto');

INSERT INTO Pokemon (pokemon_id, nombre_pokemon, tipo_id, altura, peso) VALUES
(1, 'Charmander', 1, 0.6, 8.5),
(2, 'Squirtle', 2, 0.5, 9.0),
(3, 'Bulbasaur', 3, 0.7, 6.9);

INSERT INTO Movimiento (movimiento_id, nombre_movimiento, tipo_id, potencia, precision) VALUES
(1, 'Lanzallamas', 1, 90, 1.0),
(2, 'Burbuja', 2, 40, 1.0),
(3, 'Latigo Cepa', 3, 45, 1.0);

INSERT INTO EntrenadorPokemon (entrenador_pokemon_id, entrenador_id, pokemon_id, nivel) VALUES
(1, 1, 1, 10),
(2, 2, 2, 12),
(3, 3, 3, 8);

INSERT INTO PokemonMovimiento (pokemon_movimiento_id, pokemon_id, movimiento_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

SELECT * FROM entrenador
SELECT * FROM pokemon
SELECT * FROM movimiento
SELECT * FROM entrenadorpokemon
SELECT * FROM pokemonmovimiento
-- entrenador_id - pokemon_id - movimiento_id
-- nombre_entrenador - nombre_pokemon - nombre_movimiento
SELECT nombre_entrenador, nombre_pokemon
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id

SELECT nombre_pokemon, nombre_movimiento
FROM pokemonmovimiento PM
JOIN movimiento MV ON PM.movimiento_id = MV.movimiento_id
JOIN pokemon PK ON PM.pokemon_id = PK.pokemon_id

SELECT nombre_entrenador AS Entrenador, nombre_pokemon AS Pokemon, nombre_movimiento AS Movimiento
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id
JOIN movimiento MT ON PK.tipo_id = MT.tipo_id


SELECT * FROM entrenador
SELECT * FROM pokemon
SELECT * FROM tipo
SELECT * FROM movimiento
SELECT * FROM entrenadorpokemon
SELECT * FROM pokemonmovimiento
-- entrenador_id - pokemon_id - movimiento_id
-- nombre_entrenador - nombre_pokemon - nombre_movimiento
SELECT nombre_entrenador, nombre_pokemon
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id

SELECT nombre_pokemon, nombre_movimiento
FROM pokemonmovimiento PM
JOIN movimiento MV ON PM.movimiento_id = MV.movimiento_id
JOIN pokemon PK ON PM.pokemon_id = PK.pokemon_id

SELECT nombre_entrenador AS Entrenador, nombre_pokemon AS Pokemon, nombre_movimiento AS Movimiento
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id
JOIN movimiento MT ON PK.pokemon_id = MT.movimiento_id


SELECT nombre_entrenador AS Entrenador, nombre_pokemon AS Pokemon, nombre_movimiento AS Movimiento
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id
JOIN movimiento MT ON PK.tipo_id = MT.tipo_id






INSERT INTO Tipo (tipo_id, nombre_tipo) VALUES
(4, 'Eléctrico'),
(5, 'Roca'),
(6, 'Tierra'),
(7, 'Psíquico'),
(8, 'Volador');

INSERT INTO Entrenador (entrenador_id, nombre_entrenador, region) VALUES
(4, 'Erika', 'Kanto'),
(5, 'Surge', 'Kanto'),
(6, 'Sabrina', 'Kanto'),
(7, 'Giovanni', 'Kanto');

INSERT INTO Pokemon (pokemon_id, nombre_pokemon, tipo_id, altura, peso) VALUES
(4, 'Pikachu', 4, 0.4, 6.0),
(5, 'Onix', 5, 8.8, 210.0),
(6, 'Geodude', 5, 0.4, 20.0),
(7, 'Psyduck', 7, 0.8, 19.6),
(8, 'Pidgey', 8, 0.3, 1.8);

INSERT INTO Movimiento (movimiento_id, nombre_movimiento, tipo_id, potencia, precision) VALUES
(4, 'Impactrueno', 4, 40, 1.0),
(5, 'Roca Afilada', 5, 100, 0.8),
(6, 'Terremoto', 6, 100, 1.0),
(7, 'Confusión', 7, 50, 1.0),
(8, 'Ataque Ala', 8, 60, 1.0);

INSERT INTO EntrenadorPokemon (entrenador_pokemon_id, entrenador_id, pokemon_id, nivel) VALUES
(4, 5, 4, 15),
(5, 6, 7, 20),
(6, 3, 5, 18),
(7, 2, 3, 13),
(8, 4, 8, 22);

INSERT INTO PokemonMovimiento (pokemon_movimiento_id, pokemon_id, movimiento_id) VALUES
(4, 4, 4),
(5, 5, 5),
(6, 6, 5),
(7, 7, 7),
(8, 8, 8);

INSERT INTO Pokemon (pokemon_id, nombre_pokemon, tipo_id, altura, peso) VALUES
(9, 'Jigglypuff', 7, 0.5, 5.5),
(10, 'Meowth', 7, 0.4, 4.2),
(11, 'Machop', 6, 0.8, 19.5),
(12, 'Bellsprout', 3, 0.7, 4.0),
(13, 'Magnemite', 4, 0.3, 6.0),
(14, 'Diglett', 6, 0.2, 0.8),
(15, 'Goldeen', 2, 0.6, 15.0),
(16, 'Rapidash', 1, 1.7, 95.0),
(17, 'Zapdos', 4, 1.6, 52.6),
(18, 'Golem', 5, 1.4, 300.0),
(19, 'Alakazam', 7, 1.5, 48.0),
(20, 'Doduo', 8, 1.4, 39.2);

INSERT INTO Entrenador (entrenador_id, nombre_entrenador, region) VALUES
(8, 'Lt. Surge', 'Kanto'),
(9, 'Koga', 'Kanto'),
(10, 'Blaine', 'Kanto'),
(11, 'Janine', 'Johto'),
(12, 'Falkner', 'Johto'),
(13, 'Whitney', 'Johto'),
(14, 'Bugsy', 'Johto');

INSERT INTO EntrenadorPokemon (entrenador_pokemon_id, entrenador_id, pokemon_id, nivel) VALUES
(9, 8, 13, 23),
(10, 9, 14, 30),
(11, 10, 16, 45),
(12, 11, 9, 25),
(13, 12, 20, 14),
(14, 13, 15, 17),
(15, 14, 12, 20),
(16, 8, 17, 50),
(17, 9, 18, 42),
(18, 10, 19, 53),
(19, 11, 11, 28);

INSERT INTO PokemonMovimiento (pokemon_movimiento_id, pokemon_id, movimiento_id) VALUES
(9, 9, 7),
(10, 10, 7),
(11, 11, 6),
(12, 12, 3),
(13, 13, 4),
(14, 14, 6),
(15, 15, 2),
(16, 16, 1),
(17, 17, 4),
(18, 18, 5),
(19, 19, 7),
(20, 20, 8);