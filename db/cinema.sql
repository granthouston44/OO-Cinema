DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR,
  wallets DECIMAL(4, 2)
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price DECIMAL(4, 2)
)


CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  showtimes VARCHAR,
  film_id REFERENCES films(id)
)
