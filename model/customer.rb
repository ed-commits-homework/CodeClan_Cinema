require_relative('./film')

class Customer
    attr_reader :id
    attr_accessor :name, :funds
    
    def Customer.initialize_many(array)
        return array.map{|entry| Customer.new(entry)}
    end
    
    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @funds = options["funds"].to_i
        if @id.nil?
            save
        else
            update
        end
    end

    def save()
        sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
        values = [@name, @funds]
        row = SqlRunner.run(sql, values).first
        @id = row['id'].to_i
    end

    def update()
        sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values).first
    end

    def check_wallet
        puts "#{@name} has $#{@funds} in their wallet"
    end

    def list_films
        sql = "SELECT * FROM films
                INNER JOIN tickets
                ON tickets.film_id = id
                WHERE tickets.customer_id = $1"
        values = [@id]
        return Film.initialize_many(SqlRunner.run(sql, values))
    end

    def display_films
        puts "#{@name} is watching.."
        list_films.each do |film|
            puts "- #{film.title}"
        end
        puts
    end
end
