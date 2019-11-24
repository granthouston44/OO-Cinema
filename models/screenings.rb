require_relative('../db/sql_runner')


class Screening

  attr_reader :id

  attr_accessor :showtime, :tickets_available

  def initialize(screening_details)
    @id = screening_details['id'].to_i if screening_details['id']
    @showtime = screening_details['showtime']
    @tickets_available = 5
  end


  def save()
    sql = "
    INSERT INTO screenings
    (showtime, tickets_available)
    VALUES ($1, $2)
    RETURNING id
    "
    values = [@showtime, @tickets_available]
    showtime = SqlRunner.run(sql, values).first
    @id = showtime['id'].to_i
  end

  def update()
  sql = "
  UPDATE screenings
  SET (showtime, tickets_available)
  = ($1, $2)
  WHERE id = $3
  "
  values = [@showtime, @tickets_available, @id]
  SqlRunner.run(sql,values)
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "
    SELECT * FROM screenings
    "
    result = SqlRunner.run(sql)
    return result.map {|screening| Screening.new(screening)}
  end

  def delete()
    sql = "
    DELETE FROM screenings
    WHERE id = $1
    "
    values = [@id]
    SqlRunner.run(sql,values)
  end

end
