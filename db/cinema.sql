DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR,
  wallet DECIMAL(4, 2),
  number_of_tickets INT
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price DECIMAL(4, 2),
  number_of_customers INT
);


CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  film_id INT REFERENCES films(id),
  showtime VARCHAR,
  tickets_available INT
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  tickets_available INT,
  film_id INT REFERENCES films(id)
);
