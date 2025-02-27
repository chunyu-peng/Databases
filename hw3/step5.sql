DROP TABLE IF EXISTS locations;

CREATE TABLE locations (place VARCHAR(15) PRIMARY KEY, geom GEOMETRY);

INSERT INTO locations VALUES
('Apartment', 'POINT(-118.25769715127021 34.04063885742853)'),
('Chase Bank', 'POINT(-118.26168480451697 34.04164809304171)'),
('Centle Monster', 'POINT(-118.25495451197153 34.04340488195623)'),
('Starbucks', 'POINT(-118.25339479159103 34.039950184246024)'),
('Tu Talla', 'POINT(-118.25430674268391 34.03610054384179)'),
('Laurel''s House', 'POINT(-118.25882358267279 34.03474912746054)'),
('Kinema Fitness', 'POINT(-118.26124247594043 34.03871510807627)'),
('Smw Auto Park', 'POINT(-118.2526808647041 34.038528406252226)'),
('Richline Text', 'POINT(-118.25994076588645 34.03074577486716)'),
('CVS', 'POINT(-118.25784680514333 34.04563817357083)'),
('Staples Center', 'POINT(-118.26719081827046 34.043132437689295)'),
('Hospital Cal', 'POINT(-118.24679073371546 34.040919936365185)'),
('Maple Plaza', 'POINT(-118.2561173202666 34.035802913880495)');

SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom)))
FROM locations;

SELECT place, ST_AsText(geom)
FROM locations
WHERE place <> 'Apartment'
ORDER BY ST_Distance(geom,'POINT(-118.25769715127021 34.04063885742853)')
LIMIT 4;

-- DROP TABLE locations;