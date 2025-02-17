CREATE TABLE flights {
    --Primary key is just saying that this is the primary way I will search for the flight--
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL, --NOT NULL, if there is a flight it needs to have an origin, destination, duration therefore it cannot be empty
    --otherwise the database will reject it if there is no origin, destination or duration
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
};

--CREATEing Tables--

CREATE TABLE flights {
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
};

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    code VARCHAR NOT NULL,
    name VARCHAR NOT NULL
);

CREATE TABLE passengers(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
);

--INSERTing Values into table

INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);
INSERT INTO flights (origin, destination, duration) VALUES ('Shanghai', 'Paris', 760);
INSERT INTO flights (origin, destination, duration) VALUES ('Istanbul', 'Tokyo', 700);
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'Paris', 435);
INSERT INTO flights (origin, destination, duration) VALUES ('Moscow', 'Paris', 245);
INSERT INTO flights (origin, destination, duration) VALUES ('Lima', 'New York', 455);

INSERT INTO locations (code, name) VALUES ('JFK', 'New York');
INSERT INTO locations (code, name) VALUES ('PVG', 'Shanghai');
INSERT INTO locations (code, name) VALUES ('IST', 'Istanbul');
INSERT INTO locations (code, name) VALUES ('LHR', 'London');
INSERT INTO locations (code, name) VALUES ('SVO', 'Moscow');
INSERT INTO locations (code, name) VALUES ('LIM', 'Lima');
INSERT INTO locations (code, name) VALUES ('CDG', 'Paris');
INSERT INTO locations (code, name) VALUES ('NRT', 'Tokyo');

INSERT INTO passengers (name, flight_id) VALUES ('alice', 2);
INSERT INTO passengers (name, flight_id) VALUES ('bob', 1);
INSERT INTO passengers (name, flight_id) VALUES ('charlie', 2);
INSERT INTO passengers (name, flight_id) VALUES ('dave', 2);
INSERT INTO passengers (name, flight_id) VALUES ('erin', 4);
INSERT INTO passengers (name, flight_id) VALUES ('frank', 6);
INSERT INTO passengers (name, flight_id) VALUES ('grace', 6);

--SELECT Examples--

SELECT origin, destination FROM flights; 

SELECT * FROM flights WHERE id = 3; 

SELECT * FROM flights WHERE origin = 'New York'; 

SELECT * FROM flights WHERE destination = 'Paris' AND duration > '500'; 

SELECT AVG(duration) FROM flights; 

SELECT COUNT(*) FROM flights; 

SELECT COUNT(*) FROM flights WHERE origin = 'New York'; 

SELECT * FROM flights WHERE origin LIKE '%a%';

SELECT * FROM flights LIMIT 2; --Limit the number of values--

SELECT * FROM flights ORDER BY duration ASC; --Order the values by duration in ascending order (DSC for descending order)

SELECT origin, COUNT(*) FROM flights GROUP BY origin; --Popular origins--

SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1; --only count the origins > 1-- 

SELECT * FROM flights

-- Inner Join Example--

SELECT origin, destination, name FROM flights JOIN passengers ON passengers.flight_id = flights.id; 

SELECT origin, destination, name FROM flights JOIN passengers ON passengers.flight_id = flights.id WHERE name = 'alice'; 

-- Left Join Example --

SELECT origin, destination, name FROM flights LEFT JOIN passengers ON passengers.flight_id = flights.id; 

--Update Example--

Update flights SET duration = 430 WHERE origin = 'New York' AND destination = 'London'; 

--Delete Example--

DELETE FROM flights WHERE destination = 'Tokyo';



CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    pass VARCHAR NOT NULL
);