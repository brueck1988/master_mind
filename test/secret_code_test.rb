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

# @player_input == "q"
# @message.quit
#   exit
# else @secret_code == @player_input
#   finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
#   run_time =  (finish_time - @starting_time).to_i
#   p "Congratulations! You have have cracked the code #{@player_input.input.join} in #{run_time} seconds using #{@count} guess(es)!!!"
#   p "Would you like to play again? Press (P) to play again or (Q) to quit."
#   user_prompt = gets.chomp.upcase
# if @player_input == "P"
#   start
# elsif @player_input == "Q"
#   @message.quit
#   end
