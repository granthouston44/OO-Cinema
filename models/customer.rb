require_relative('../db/sql_runner')
require_relative('film')
require_relative('tickets')

class Customer

  attr_reader :id
  attr_accessor :name, :wallet

  def initialize(customer_details)
    @id = customer_details['id'].to_i if customer_details['id']
    @name = customer_details['name']
    @wallet = customer_details['wallet'].to_f
    @number_of_tickets = customer_details['number_of_tickets']
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
    SET (name, wallet, number_of_tickets) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @wallet, @number_of_tickets, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map {|customer| Customer.new(customer)}
  end

  def film_tickets()
    sql = "
    SELECT films.* FROM films
    INNER JOIN tickets ON tickets.film_id =
    films.id WHERE customer_id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values)

    return nil if result.count == 0
    return result.map {|film| Film.new(film)}
  end

  def num_of_tickets()
    result = film_tickets()
    @number_of_tickets = result.count
  end

  def buy_tickets()
    tickets = film_tickets()
    tally = tickets.map {|ticket| ticket.price.to_f}
    tally.each {|price| @wallet -= price}
    num_of_tickets
    update()
  end



end
