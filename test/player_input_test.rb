require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_input'

class PlayerInputTest < Minitest::Test
  def test_it_exists_and_has_attributes
    player_code = PlayerInput.new("rygb")
    assert_instance_of PlayerInput, player_code
    assert_equal ["R", "Y", "G", "B"], player_code.input
  end

  def test_it_has_the_correct_elements
    player_code1 = PlayerInput.new("RYGB")
    assert_equal true, player_code1.valid_elements?

    player_code2 = PlayerInput.new("pygb")
    assert_equal false, player_code2.valid_elements?

    player_code3 = PlayerInput.new("GGGP")
    assert_equal false, player_code3.valid_elements?
  end

  def test_input_is_length_of_four
    player_code1 = PlayerInput.new("RYGB")
    assert_equal true, player_code1.valid_length?

    player_code2 = PlayerInput.new("pyg")
    assert_equal false, player_code2.valid_length?

    player_code3 = PlayerInput.new("GGGGG")
    assert_equal false, player_code3.valid_length?

    player_code4 = PlayerInput.new("rygb")
    assert_equal true, player_code4.valid_length?
  end
end
