DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR,
  wallet DECIMAL(4, 2)
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price DECIMAL(4, 2)
);


CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  showtimes VARCHAR,
  film_id INT REFERENCES films(id)
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  film_id INT REFERENCES films(id)
);
