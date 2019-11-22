require_relative('../db/sql_runner')
require_relative('customer')

class Film

attr_reader :id
attr_accessor :name, :price

def initialize(film_details)
  @id = film_details['id'].to_i if film_details['id']
  @title = film_details['title']
  @price = film_details['price']
end


end
