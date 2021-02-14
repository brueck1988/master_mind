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

    player_code2 = PlayerInput.new("pyb")
    assert_equal false, player_code2.valid_elements?

    player_code3 = PlayerInput.new("GGGPY")
    assert_equal false, player_code3.valid_elements?
  end

  def test_it_has_valid_length_or_invalid
    player_code1 = PlayerInput.new("RYGB")
    assert_equal true, player_code1.valid_length?

    player_code2 = PlayerInput.new("pyb")
    assert_equal false, player_code2.valid_length?

    player_code3 = PlayerInput.new("GGGPY")
    assert_equal false, player_code3.valid_length?
  end

  def test_it_has_valid_input
    player_code1 = PlayerInput.new("rygb")
    assert_equal true, player_code1.valid_input?

    player_code2 = PlayerInput.new("yyb")
    assert_equal false, player_code2.valid_input?

    player_code3 = PlayerInput.new("GGGBY")
    assert_equal false, player_code3.valid_input?

    player_code4 = PlayerInput.new("PGGBY")
    assert_equal false, player_code4.valid_input?
  end
end
