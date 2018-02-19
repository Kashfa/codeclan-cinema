require_relative("../db/sql_runner")

class Customer
  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
        name,
        funds
    )
    VALUES
    (
      $1, $2
    )
    returning *;"
    values = [@name, @funds]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i

  end

  def decrease_funds(price)
    @funds -= price
    update()
  end

  def delete()
    sql = "DELETE * FROM customers
    WHERE customer_id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
   end

  def update()
    sql = "UPDATE customers
    SET
    (
      name,
      fund
      ) =
      (
        $1, $2
      )
      WHERE id = $3;
      "
      values = [@name, @fund]
      SqlRunner.run(sql, values)
  end

  # def films()
  #   sql = "SELECT * FROM films INNER JOIN tickets
  #   ON films.id = ticket.film_id
  #   WHERE tickets.customer_id = $1"
  #   values = [@id]
  #   films = SqlRunner.run(sql, values)
  #   return films.map {|film| Film.new(film)}
  #
  # end

def Customer.delete_all()
  sql = "DELETE FROM customers;"
  SqlRunner.run(sql)
end

  def Customer.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map {|customer| customer.new(customer)}
  end
end
