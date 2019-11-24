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
      'showtimes' => ['14:00', '18:00'],
      'tickets_available' => 5
      })
  end


end
