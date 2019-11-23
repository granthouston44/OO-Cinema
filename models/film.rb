require_relative('../db/sql_runner')
require_relative('customer')

class Film

attr_reader :id
attr_accessor :title, :price

def initialize(film_details)
  @id = film_details['id'].to_i if film_details['id']
  @title = film_details['title']
  @price = film_details['price']
  @number_of_customers = film_details['number_of_customers']
end

def save()
  sql = "
  INSERT INTO films
  (title, price)
  VALUES ($1, $2)
  RETURNING id
  "
  values = [@title, @price]
  film = SqlRunner.run(sql, values).first
  @id = film['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM films WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all
  sql = "SELECT * FROM films"
  films = SqlRunner.run(sql)
  result = films.map {|film| Film.new(film)}
  return result
end

def update
  sql = "
  UPDATE films
  SET (title, price, number_of_customers) =
  ($1, $2, $3)
  WHERE id = $4
  "
  values = [@title, @price, @number_of_customers, @id]
  SqlRunner.run(sql, values)
end

 def customers
  sql = "
  SELECT customers.* FROM customers
  INNER JOIN tickets ON tickets.customer_id =
  customers.id WHERE film_id = $1
  "
  values = [@id]
  result = SqlRunner.run(sql, values)
  return nil if result.count == 0
  return result.map {|customer| Customer.new(customer)}
 end

def num_of_customers
  @number_of_customers = customers.count
  update()
end

end
