require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'

class SecretCodeGeneratorTest < Minitest::Test
  def test_it_exists
    player_code = ["R", "G", "Y", "B"]
    generated_code = SecretCodeGenerator.new(player_code)
    assert_instance_of SecretCodeGenerator, generated_code
  end

  def test_it_has_attributes
    player_code = ["R", "G", "Y", "B"]
    generated_code = SecretCodeGenerator.new(player_code)
    assert_equal player_code, generated_code.player_code
  end

  def test_generate_code
    player_code = ["R", "G", "Y", "B"]
    generated_code = SecretCodeGenerator.new(player_code)
    generated_code.generate_code
    assert_equal 4, generated_code.generate_code.length
  end

  def test_code_comparer
    player_code = ["R", "G", "Y", "B"]
    generated_code = SecretCodeGenerator.new(player_code)
    secret_code = generated_code.generate_code

    generated_code.code_comparer(player_code)

    assert_equal 4, generated_code.code_comparer(player_code)
  end

  def test_red_pin_count
    player_code = ["R", "G", "Y", "B"]
    generated_code = SecretCodeGenerator.new(player_code)
    #generated_code.generate_code
    @secret_code = generated_code.generate_code
    generated_code.code_comparer(player_code)
    count = generated_code.red_pin_count
    #require "pry";binding.pry
    assert_equal count , generated_code.red_pin_count
  end

  def test_white_pin_count
    player_code = ["R", "G", "Y", "B"]
    generated_code = SecretCodeGenerator.new(player_code)
    #generated_code.generate_code
    count = generated_code.code_comparer(player_code).count("red pin")
    generated_code.code_comparer(player_code)

    assert_equal count, generated_code.white_pin_count
  end
end
