require_relative('../db/sql_runner')

class Screening

attr_reader :id

attr_accessor :film_id, :showtimes, :tickets_available

def initialize(screening_details)
  @id = screening_details['id'].to_i if screening_details['id']
  @film_id = screening_details['film_id'].to_i
  @showtimes = screening_details['showtimes']
  @tickets_available = 5
end




end
