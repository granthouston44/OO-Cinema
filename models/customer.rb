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


end
