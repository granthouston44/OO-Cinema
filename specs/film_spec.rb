require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/film')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class FilmTest < MiniTest::Test

  def test_can_create_film_object

  Customer.new({
    'title' => 'Avengers', 'price' => 5.99
    })
  end




end
