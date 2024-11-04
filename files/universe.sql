
CREATE DATABASE universe;


\c universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    type TEXT NOT NULL, -- TEXT data type for galaxy type
    age_in_billion_years NUMERIC(5, 2) NOT NULL, -- NUMERIC data type
    has_black_hole BOOLEAN NOT NULL
);


INSERT INTO galaxy (name, type, age_in_billion_years, has_black_hole) VALUES
('Milky Way', 'Spiral', 13.6, TRUE),
('Andromeda', 'Spiral', 10.0, TRUE),
('Triangulum', 'Spiral', 12.0, FALSE),
('Whirlpool', 'Spiral', 10.5, TRUE),
('Sombrero', 'Elliptical', 13.0, TRUE),
('Pinwheel', 'Spiral', 13.2, FALSE);

-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    description TEXT NOT NULL, 
    age_in_billion_years NUMERIC(4, 2) NOT NULL,
    is_visible BOOLEAN NOT NULL
);


INSERT INTO star (name, galaxy_id, description, age_in_billion_years, is_visible) VALUES
('Sun', 1, 'A G-type main-sequence star at the center of the Solar System', 4.6, TRUE),
('Sirius', 1, 'Brightest star in the night sky', 0.3, TRUE),
('Alpha Centauri', 1, 'Closest star system to the Solar System', 4.0, TRUE),
('Betelgeuse', 2, 'A red supergiant star in the Orion constellation', 8.0, TRUE),
('Rigel', 2, 'A blue supergiant star also in Orion', 8.0, FALSE),
('Vega', 3, 'The fifth brightest star in the night sky', 0.4, TRUE);

-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    mass_in_earth_masses NUMERIC(10, 2) NOT NULL,
    has_life BOOLEAN NOT NULL
);


INSERT INTO planet (name, star_id, mass_in_earth_masses, has_life) VALUES
('Earth', 1, 1.00, TRUE),
('Mars', 1, 0.11, FALSE),
('Venus', 1, 0.82, FALSE),
('Jupiter', 1, 317.8, FALSE),
('Saturn', 1, 95.2, FALSE),
('Neptune', 1, 17.1, FALSE),
('Planet X', 2, 5.0, FALSE),
('Proxima b', 3, 1.3, FALSE),
('Kepler-22b', 4, 2.4, FALSE),
('Kepler-452b', 4, 5.0, FALSE),
('Kepler-1649c', 5, 1.2, FALSE),
('GJ 1214b', 6, 6.5, FALSE);


CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    diameter_in_km INT NOT NULL, 
    is_visible BOOLEAN NOT NULL
);

INSERT INTO moon (name, planet_id, diameter_in_km, is_visible) VALUES
('Moon', 1, 3474, TRUE),
('Phobos', 2, 22, TRUE),
('Deimos', 2, 12, TRUE),
('Europa', 4, 3122, TRUE),
('Ganymede', 4, 5268, TRUE),
('Io', 4, 3643, TRUE),
('Callisto', 4, 4820, TRUE),
('Titan', 5, 5150, TRUE),
('Rhea', 5, 1528, FALSE),
('Mimas', 5, 396, TRUE),
('Enceladus', 5, 504, TRUE),
('Triton', 6, 2706, TRUE),
('Charon', 7, 1212, TRUE),
('Miranda', 6, 471, TRUE),
('Oberon', 6, 1523, FALSE),
('Titania', 6, 1578, TRUE),
('Umbriel', 6, 1169, FALSE),
('Ariel', 6, 1158, TRUE),
('Nereid', 6, 340, FALSE),
('Proteus', 6, 420, TRUE);


CREATE TABLE asteroid_belt (
    asteroid_belt_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    description TEXT, 
    num_asteroids INT NOT NULL,
    has_planetary_collisions BOOLEAN NOT NULL
);


INSERT INTO asteroid_belt (name, galaxy_id, description, num_asteroids, has_planetary_collisions) VALUES
('Main Belt', 1, 'Region of the Solar System located between Mars and Jupiter', 1000000, TRUE),
('Kuiper Belt', 1, 'A circumstellar disc in the Solar System beyond the planets', 70000, FALSE),
('Oort Cloud', 1, 'Theoretical cloud of icy objects surrounding the Solar System', 100000000, FALSE);
