class Film
    attr_reader :id
    attr_accessor :title, :price
    
    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @title = options["title"]
        @price = options["price"].to_i
        save
    end

    def save()
        sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
        values = [@title, @price]
        row = SqlRunner.run(sql, values).first
        @id = row['id'].to_i
    end

    def update()
        sql = "UPDATE films SET (title, price) = ($1, $2)"
        values = [@title, @price]
        SqlRunner.run(sql, values)
    end
end
