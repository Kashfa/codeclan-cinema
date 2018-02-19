require_relative("../db/sql_runner")

class Film

  attr_accessor :title, :price
  attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @price = options['price'].to_i
 end

 def save()
   sql = "INSERT INTO films
   (
     title,
     price

   )
   VALUES
   (
     $1, $2
   )
   returning *;
   "
   values = [@title, @price]
   results = SqlRunner.run(sql, values)
   @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE films
    SET
    (
      title,
      price
      ) =
      (
        $1, $2
        )
        WHERE id = $3;
        "
        values = [@title, @price]
        SqlRunner.run(sql, values)
      end

  def Film.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map {|film| Film.new(film)}
  end

  def Film.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end
end
