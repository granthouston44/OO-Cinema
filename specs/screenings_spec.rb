require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/screenings')
require_relative('../models/film')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class ScreeningTest < MiniTest::Test

  def test_can_create_screening_object
    film2 = Film.new({
      'title' => 'Tangled',
      'price' => '6.99'
      })

    Screening.new({
      'film_id' => film2.id,
      'showtime' => '14:00'
      })
  end


end
