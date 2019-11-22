require_relative('../db/sql_runner')
require_relative('film')

class Customer

attr_reader :id
attr_accessor :name, :fee

def initialize(customer_details)
  @id = customer_details['id'].to_i if customer_details['id']
  @name = customer_details['name']
  @fee = customer_details['fee']
end

def save()
  sql = "
  INSERT INTO customers
  (name, fee)
  VALUES ($1, $2)
  RETURNING id"
  values = [@name, @fee]
  customer = SqlRunner.run(sql, values)
  @id = customer['id'].to_i  
end


end
