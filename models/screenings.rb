require_relative('../db/sql_runner')

class Screening

  attr_reader :id

  attr_accessor :film_id, :showtimes, :tickets_available

  def initialize(screening_details)
    @id = screening_details['id'].to_i if screening_details['id']
    @film_id = screening_details['film_id'].to_i
    @showtime = screening_details['showtime']
    @tickets_available = 5
  end


  def save()
    sql = "
    INSERT INTO screenings
    (film_id, showtime, tickets_available)
    VALUES ($1, $2, $3)
    RETURNING id
    "
    values = [@film_id, @showtime, @tickets_available]
    showtime = SqlRunner.run(sql, values).first
    @id = showtime['id'].to_i
  end

  def update()

  end

  def self.delete_all

  end

  def self.all

  end

  def delete()


  end




end
