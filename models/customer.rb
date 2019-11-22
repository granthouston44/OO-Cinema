require_relative('../db/sql_runner')
require_relative('film')

class Customer

attr_reader :id
attr_accessor :name, :wallet

def initialize(customer_details)
  @id = customer_details['id'].to_i if customer_details['id']
  @name = customer_details['name']
  @wallet = customer_details['wallet'].to_i
end

def save()
  sql = "
  INSERT INTO customers
  (name, wallet)
  VALUES ($1, $2)
  RETURNING id"
  values = [@name, @wallet]
  customer = SqlRunner.run(sql, values).first
  @id = customer['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM customers where id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def update()
  sql = "
  UPDATE customers
  SET (name, wallet) =
  ($1, $2)
  WHERE id = $3"
  values = [@name, @wallet, @id]
  SqlRunner.run(sql, values)
end

def self.all
  sql = "SELECT * FROM customers"
  customers = SqlRunner.run(sql)
  return customers.map {|customer| Customer.new(customer)}
end

end
