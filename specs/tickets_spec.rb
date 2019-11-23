require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/tickets')
require_relative('../models/film')
require_relative('../models/customer')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TicketTest < MiniTest::Test

def test_can_create_ticket_object
  customer1 = Customer.new({
    'name' => 'Grant', 'wallet' => 20
    })

    film2 = Film.new({
      'title' => 'Tangled',
      'price' => '6.99'
      })

    Ticket.new({
    'cust_id' => customer1.id,
    'film_id' => film2.id
    })
end



end
