require_relative('models/customer')
require_relative('models/film')
require_relative('models/screenings')
require_relative('models/tickets')

require('pry')

# Ticket.delete_all()
# Screening.delete_all()
# Film.delete_all()
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




binding.pry


nil
