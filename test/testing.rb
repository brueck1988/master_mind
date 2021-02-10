require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class TestingTest < Minitest::Test

  def test_it_has_a_length_of_1
    user_input = Player.new('r')
    assert_equal 'r', user_input.length
  end

  def test_user_input_returns_an_array
    user_input = Player.new('r')
    assert_equal [user_input], user_input.return_array
  end


  def test_computer_code_is_one
    computer_code = Code.new('y')
    assert_equal 'y', computer_code.length
  end

  def test_computer_code_returns_an_array
    computer_code = Player.new('r')
    assert_equal [computer_code], computer_code.return_array
  end


  def test_it_can_compare_code
    user_input = Player.new('r')
    computer_code = Code.new('y')
  end
end
