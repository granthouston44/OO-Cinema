require_relative('../db/sql_runner')

class Ticket




  def initialize(ticket_details)
    @id = ticket_details['id'].to_i if ticket_details['id']
    @cust_id = ticket_details['cust_id'].to_i
    @film_id = ticket_details['film_id'].to_i
  end


end
