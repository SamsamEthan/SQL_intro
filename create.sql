CREATE TABLE flights {
    --Primary key is just saying that this is the primary way I will search for the flight--
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL, --NOT NULL, if there is a flight it needs to have an origin, destination, duration therefore it cannot be empty
    --otherwise the database will reject it if there is no origin, destination or duration
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
};