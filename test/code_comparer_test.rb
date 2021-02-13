require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'
require './lib/player_input'
require './lib/code_comparer'

class CodeComparerTest < Minitest::Test
  def test_it_exists
    player_code    = PlayerInput.new("prgb")
    computer_code  = SecretCode.new
    generated_code = CodeComparer.new(computer_code, player_code.input)

    assert_instance_of CodeComparer, generated_code
  end


  def test_code_comparer
    player_code    = PlayerInput.new("prgb")
    computer_code  = SecretCode.new.generate_code
    generated_code = CodeComparer.new(computer_code, player_code.input)
    # require "pry"; binding.pry
    generated_code.code_comparer(computer_code, player_code.input)

    assert_equal [""], generated_code
  end

  # def test_red_pin_count
  #   player_code = ["R", "G", "Y", "B"]
  #   generated_code = SecretCodeGenerator.new(player_code)
  #   #generated_code.generate_code
  #   @secret_code = generated_code.generate_code
  #   generated_code.code_comparer(player_code)
  #   count = generated_code.red_pin_count
  #   #require "pry";binding.pry
  #   assert_equal count , generated_code.red_pin_count
  # end
  #
  # def test_white_pin_count
  #   player_code = ["R", "G", "Y", "B"]
  #   generated_code = SecretCodeGenerator.new(player_code)
  #   #generated_code.generate_code
  #   count = generated_code.code_comparer(player_code).count("red pin")
  #   generated_code.code_comparer(player_code)
  #
  #   assert_equal count, generated_code.white_pin_count
  # end
end
