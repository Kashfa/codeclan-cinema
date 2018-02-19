require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all

customer1 = Customer.new({'name' => 'Sandy', 'funds' => 20})
customer2 = Customer.new({'name' => 'Raj', 'funds' => 50})
customer3 = Customer.new({'name' => 'Tyrone', 'funds' => 40})
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({'title' => 'Jumanji', 'price' => 5})
film2 = Film.new({'title' => 'Black Panther', 'price' => 5})
film3 = Film.new({'title' => 'The Post', 'price' => 5})
film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket1.save()
ticket2.save()
ticket2.save()

binding.pry
nil
