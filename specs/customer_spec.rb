require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/customer')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test


def test_can_create_customer_ojbect
  Customer.new({
    'name' => 'Grant', 'wallet' => 20
    })
end


end
