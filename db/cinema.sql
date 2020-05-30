DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS films CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    funds INT
);

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    price INT
);

CREATE TABLE tickets (
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    film_id INT REFERENCES films(id) ON DELETE CASCADE
);
