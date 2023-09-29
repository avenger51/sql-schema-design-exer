DROP DATABASE IF EXISTS outerspace;

CREATE DATABASE outerspace;

\c outerspace

CREATE TABLE galaxies (
  galaxy_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons (
  moon_id SERIAL PRIMARY KEY,
  name TEXT,
  host_planet INTEGER
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(galaxy_id),
  moon_id INTEGER REFERENCES moons(moon_id)
);

INSERT INTO moons (name, host_planet)
VALUES
 ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 3),
  ('Galatea', 3),
  ('Larissa', 3),
  ('Proteus', 3),
  ('TritonNereid', 3),
  ('Thalassa', 3),
  ('Despina', 4);


INSERT INTO planets
  (name, orbital_period, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1),
  ('Mars', 1.88, 'The Sun', 1),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1);

