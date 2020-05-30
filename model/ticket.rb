class Ticket
    attr_reader :customer_id, :film_id

    def Ticket.buy(customer, film)
        if customer.funds > film.price
            puts "#{customer.name} bought a ticket for #{film.title}"

            customer.funds -= film.price
            customer.update

            return Ticket.new({
                "customer_id" => customer.id,
                "film_id" => film.id
            })
        end

        return nil
    end
    
    def initialize(options)
        @customer_id = options["customer_id"].to_i
        @film_id = options["film_id"].to_i
        save
    end

    def save()
        sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2)"
        values = [@customer_id, @film_id]
        SqlRunner.run(sql, values)
    end
end
