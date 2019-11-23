require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')


class Ticket

  attr_reader :id
  attr_accessor :cust_id, :film_id

  def initialize(ticket_details)
    @id = ticket_details['id'].to_i if ticket_details['id']
    @cust_id = ticket_details['cust_id'].to_i
    @film_id = ticket_details['film_id'].to_i
  end

def self.delete_all
  sql = "DELETE FROM tickets"
  SqlRunner.run(sql)
end

def save
  sql = "
  INSERT INTO tickets
  (customer_id, film_id)
  VALUES ($1, $2)
  RETURNING id"
  values = [@cust_id, @film_id]
  ticket = SqlRunner.run(sql, values).first
  @id = ticket['id'].to_i
end


end
