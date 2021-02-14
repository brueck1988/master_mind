require './lib/secret_code'
require './lib/player_input'
require './lib/code_analyzer'
require './lib/game_message'
require 'time'

class Game
  attr_reader :message
  attr_accessor :code_comparer,
                :player_input,
                :secret_code

  def initialize
    @message = Messages.new
    @count = 0
    @secret_code = SecretCode.new.generate_code
  end

  def start
    @message.welcome
    user_prompt = gets.chomp.upcase
  if user_prompt == 'P'
    @message.intro
    #require "pry";binding.pry
    turn
  elsif user_prompt == 'I'
    @message.instructions
    turn
  elsif user_prompt == 'Q'
    @message.quit
  else
    start
    end
  end

  def turn
    @count += 1
    @starting_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    user_prompt = gets.chomp.upcase
    player_input = PlayerInput.new(user_prompt)
  if user_prompt == "SECRET"
    p @secret_code
    user_prompt = gets.chomp.upcase
    player_input = PlayerInput.new(user_prompt)
    next
  elsif player_input.valid_input
    p code = CodeAnalyzer.new(secret_code, player_input.input)
    code.code_comparer(secret_code, player_input.input)
    p "Your guess #{player_input.input.join} returns #{code.white_pin_count} white_pins and #{code.red_pin_count} red pins."
    p "You've taken #{@count} guess(es)"
    if secret_code == player_input.input
      finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      run_time =  (finish_time - @starting_time).to_i
      p "Congratulations! You have have cracked the code #{player_input.input.join} in #{run_time} seconds using #{@count} guess(es)!!!"
      p "Would you like to play again? Press (P) to play again or (Q) to quit."
      user_prompt = gets.chomp.upcase
      if P
        start
      elsif Q
        @message.quit
      else
        start
      end
    end
  elsif player_input.valid_length?
  else player_input.valid_elements?
    end
    print ">"
    turn
  end
end
