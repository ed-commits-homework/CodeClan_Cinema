class Film
    attr_reader :id
    attr_accessor :title, :price

    def Film.initialize_many(array)
        return array.map{|entry| Film.new(entry)}
    end
    
    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @title = options["title"]
        @price = options["price"].to_i
        if @id.nil?
            save
        else
            update
        end
    end

    def save()
        sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
        values = [@title, @price]
        row = SqlRunner.run(sql, values).first
        @id = row['id'].to_i
    end

    def update()
        sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
        values = [@title, @price, @id]
        SqlRunner.run(sql, values)
    end

    def list_customers
        sql = "SELECT * FROM customers
                INNER JOIN tickets
                ON tickets.customer_id = id
                WHERE tickets.film_id = $1"
        values = [@id]
        return Customer.initialize_many(SqlRunner.run(sql, values))
    end
end
