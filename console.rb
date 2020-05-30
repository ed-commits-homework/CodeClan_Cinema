require('pry')
require_relative('./db/sqlrunner')
require_relative('./model/customer')
require_relative('./model/film')
require_relative('./model/ticket')

SqlRunner.run("SELECT * FROM tickets")

cartman = Customer.new({
    "name" => "cartman",
    "funds" => 100
})
barney = Customer.new({
    "name" => "barney",
    "funds" => 60
})
homer = Customer.new({
    "name" => "homer",
    "funds" => 36
})

bee_movie = Film.new({
    "title" => "Bee Movie",
    "price" => 15,
})
pulp_fiction = Film.new({
    "title" => "Pulp Fiction",
    "price" => 60,
})
forest_gump = Film.new({
    "title" => "Forest Gump",
    "price" => 35,
})

Ticket.buy(cartman, bee_movie)
Ticket.buy(cartman, pulp_fiction)
Ticket.buy(cartman, forest_gump)
Ticket.buy(barney, bee_movie)
Ticket.buy(homer, forest_gump)

puts cartman.check_wallet
puts barney.check_wallet
puts homer.check_wallet
