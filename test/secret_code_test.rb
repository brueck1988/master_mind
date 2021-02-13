require 'minitest/autorun'
require 'minitest/pride'
require './lib/secret_code'

class SecretCodeTest < Minitest::Test
  def test_it_exists_and_has_attributes
    cpu_code = SecretCode.new
    assert_instance_of SecretCode, cpu_code
    assert_equal [], cpu_code.secret_code
  end

  def test_it_can_generate_code
    cpu_code = SecretCode.new
    assert cpu_code.generate_code
  end
end
