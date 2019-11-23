require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')


class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(ticket_details)
    @id = ticket_details['id'].to_i if ticket_details['id']
    @customer_id = ticket_details['customer_id'].to_i
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
  values = [@customer_id, @film_id]
  ticket = SqlRunner.run(sql, values).first
  @id = ticket['id'].to_i
end


def self.all
  sql = "SELECT * FROM tickets"
  tickets = SqlRunner.run(sql)
  return tickets.map {|ticket| Ticket.new(ticket)}
end

def update
  sql = "
  UPDATE tickets
  SET (customer_id, film_id)
  = ($1, $2)
  WHERE id = $3
  "
  values = [@customer_id, @film_id, @id]
  SqlRunner.run(sql, values)
end

def delete
  sql = "
  DELETE FROM tickets
  WHERE id = $1
  "
  values = [@id]
  SqlRunner.run(sql, values)
end

end
