require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'
require './lib/player_input'
require './lib/code_analyzer'

class CodeAnalyzerTest < Minitest::Test
  def test_it_exists
    player_code    = PlayerInput.new("prgb")
    computer_code  = SecretCode.new
    codes_to_compare = CodeAnalyzer.new(computer_code, player_code.input)

    assert_instance_of CodeAnalyzer, codes_to_compare
  end


  def test_code_comparer_yrgb
    player_code    = PlayerInput.new("yrgb")
    computer_code  = (["Y", "R", "G", "B"])
    codes_to_compare = CodeAnalyzer.new(computer_code, player_code.input)

    codes_to_compare.code_comparer(computer_code, player_code.input)

    red_pins   = ["red pin", "red pin", "red pin", "red pin"]
    white_pins = ["white pin", "white pin", "white pin", "white pin"]

    expected = white_pins + red_pins
    assert_equal expected, codes_to_compare.code_comparer(computer_code, player_code.input)
  end

  def test_code_comparer_rrrr
    player_code    = PlayerInput.new("rrrr")
    computer_code  = (["Y", "R", "G", "B"])
    codes_to_compare = CodeAnalyzer.new(computer_code, player_code.input)

    codes_to_compare.code_comparer(computer_code, player_code.input)

    red_pins   = [nil, "red pin", nil, nil]
    white_pins = ["white pin", "white pin", "white pin", "white pin"]

    expected = white_pins + red_pins
    assert_equal expected, codes_to_compare.code_comparer(computer_code, player_code.input)
  end

  def test_red_pin_count
    player_code    = PlayerInput.new("yrgb")
    computer_code  = (["Y", "R", "G", "B"])
    codes_to_compare = CodeAnalyzer.new(computer_code, player_code.input)

    codes_to_compare.code_comparer(computer_code, player_code.input)

    assert_equal 4, codes_to_compare.red_pin_count

    player_code1    = PlayerInput.new("yrgb")
    computer_code1  = (["G", "Y", "B", "B"])
    codes_to_compare1 = CodeAnalyzer.new(computer_code1, player_code1.input)

    codes_to_compare1.code_comparer(computer_code1, player_code1.input)

    assert_equal 1, codes_to_compare1.red_pin_count
  end

  def test_white_pin_count
    player_code    = PlayerInput.new("yrgb")
    computer_code  = (["Y", "R", "G", "B"])
    codes_to_compare = CodeAnalyzer.new(computer_code, player_code.input)

    codes_to_compare.code_comparer(computer_code, player_code.input)

    assert_equal 0, codes_to_compare.white_pin_count

    player_code    = PlayerInput.new("bgry")
    computer_code  = (["Y", "R", "G", "B"])
    codes_to_compare = CodeAnalyzer.new(computer_code, player_code.input)

    codes_to_compare.code_comparer(computer_code, player_code.input)

    assert_equal 4, codes_to_compare.white_pin_count
  end
end
