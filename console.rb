require_relative('models/customer')
require_relative('models/film')
require_relative('models/screenings')
require_relative('models/tickets')

require('pry')

Ticket.delete_all()
# Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Grant', 'wallet' => 20
  })

customer2 = Customer.new({
    'name' => 'Andrew', 'wallet' => 20
    })

customer3 = Customer.new({
      'name' => 'Brendan', 'wallet' => 20
      })

customer4 = Customer.new({
        'name' => 'Emma', 'wallet' => 20
        })

customer5 = Customer.new({
          'name' => 'Debbie', 'wallet' => 20
          })
customer1.save()

customer2.save()

customer3.save()

customer4.save()

customer5.save()


film1 = Film.new({
  'title' => 'trainspotting',
  'price' => 6.99
  })
film1.save()

film2 = Film.new({
  'title' => 'Tangled',
  'price' => '6.99'
  })
film2.save()

film3 = Film.new({
  'title' => 'Choomah Island 3: Denoument',
  'price' => '6.99'
  })
  film3.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film3.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film3.id
  })

ticket4 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id
  })

ticket5 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film2.id
  })
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

customer1.buy_tickets
customer2.buy_tickets
customer3.buy_tickets
customer4.buy_tickets
film1.num_of_customers
film2.num_of_customers
film3.num_of_customers


binding.pry


nil
