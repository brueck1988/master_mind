require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'
require './lib/player_input'
require './lib/code_comparer'

class CodeAnalyzerTest < Minitest::Test
  def test_it_exists
    player_code    = PlayerInput.new("prgb")
    computer_code  = SecretCode.new
    generated_code = CodeAnalyzer.new(computer_code, player_code.input)

    assert_instance_of CodeAnalyzer, generated_code
  end


  def test_code_comparer
    player_code    = PlayerInput.new("yrgb")
    computer_code  = (["Y", "R", "G", "B"])
    generated_code = CodeAnalyzer.new(computer_code, player_code.input)
    generated_code.code_comparer(computer_code, player_code.input)
    red_pins   = "red pin", "red pin", "red pin", "red pin"
    white_pins = "white pin", "white pin", "white pin", "white pin"
    expected = white_pins + red_pins
    assert_equal expected, generated_code.code_comparer(computer_code, player_code.input)
    # assert_equal white_pins, generated_code
  end

  def test_red_pin_count
    player_code    = PlayerInput.new("yrgb")
    computer_code  = (["Y", "R", "G", "B"])
    generated_code = CodeAnalyzer.new(computer_code, player_code.input)
    generated_code.code_comparer(computer_code, player_code.input)

    assert_equal 4, generated_code.red_pin_count

    player_code1    = PlayerInput.new("yrgb")
    computer_code1  = (["G", "Y", "B", "B"])
    generated_code1 = CodeAnalyzer.new(computer_code1, player_code1.input)
    generated_code1.code_comparer(computer_code1, player_code1.input)

    assert_equal 1, generated_code1.red_pin_count
  end

  def test_white_pin_count
    player_code    = PlayerInput.new("yrgb")
    computer_code  = (["Y", "R", "G", "B"])
    generated_code = CodeAnalyzer.new(computer_code, player_code.input)
    generated_code.code_comparer(computer_code, player_code.input)

    assert_equal 0, generated_code.white_pin_count
    player_code    = PlayerInput.new("bgry")
    computer_code  = (["Y", "R", "G", "B"])
    generated_code = CodeAnalyzer.new(computer_code, player_code.input)
    generated_code.code_comparer(computer_code, player_code.input)

    assert_equal 4, generated_code.white_pin_count

  end
end
