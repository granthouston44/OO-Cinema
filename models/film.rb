require_relative('../db/sql_runner')
require_relative('customer')

class Film

attr_reader :id
attr_accessor :title, :price

def initialize(film_details)
  @id = film_details['id'].to_i if film_details['id']
  @title = film_details['title']
  @price = film_details['price']
end

def save()
  sql = "
  INSERT INTO films
  (title, price)
  VALUES ($1, $2)
  RETURNING id
  "
  values = [@title, @price]
  film = SqlRunner.run(sql, values).first
  @id = film['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM films WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all
  sql = "SELECT * FROM films"
  films = SqlRunner.run(sql)
  result = films.map {|film| Film.new(film)}
  return result
end




end
