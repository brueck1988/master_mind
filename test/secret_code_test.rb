require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'

class SecretCodeGeneratorTest < Minitest::Test
  def test_it_exists
    generated_code = SecretCodeGenerator.new
    assert_instance_of SecretCodeGenerator, generated_code
  end

  # def test_it_has_attributes
  #   generated_code = SecretCodeGenerator.new
  #   assert_equal [], generated_code.secret_code
  # end

  # def test_generate_code
  #
  #   generated_code = SecretCodeGenerator.new
  #
  #   assert_equal 4, generated_code.generate_code.length
  # end

  def test_code_comparer
    generated_code = SecretCodeGenerator.new
    generated_code.generate_code
    generated_code.code_comparer
    #require "pry";binding.pry


    assert_equal "no pin", generated_code.code_comparer
  end
end
