class Customer
    attr_reader :id
    attr_accessor :name, :funds
    
    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @funds = options["funds"].to_i
        save
    end

    def save()
        sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
        values = [@name, @funds]
        row = SqlRunner.run(sql, values).first
        @id = row['id'].to_i
    end    

    def update()
        sql = "UPDATE customers SET (name, funds) = ($1, $2)"
        values = [@name, @funds]
        SqlRunner.run(sql, values).first
    end

    def check_wallet
        puts "#{@name} has $#{@funds} in their wallet"
    end
end
