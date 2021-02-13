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
    user_prompt = gets.chomp.downcase
  if user_prompt == 'p'
    @message.intro
    #require "pry";binding.pry
    turn
  elsif user_prompt == 'i'
    @message.instructions
    turn
  elsif user_prompt == 'q'
    @message.quit
  else
    start
    end
  end

  def turn
    @count += 1
    @starting_time = Time.now
    user_prompt = gets.chomp.upcase
    player_input = PlayerInput.new(user_prompt)
  if  player_input.valid_input
    p code = CodeAnalyzer.new(secret_code, player_input.input)
    p  code.code_comparer(secret_code, player_input.input)
    #require "pry";binding.pry
    p "#{player_input.input.join} has #{code.white_pin_count} of the correct elements with #{code.red_pin_count} in the correct positions."
    p "You've taken #{@count} guess(es)"
    if secret_code == player_input.input
      p "Congratulations! You have have cracked the code!!! It was #{player_input.input.join} in #{@count} guesses and in #{(@starting_time - Time.now).to_i}___time"
      start
    end
  elsif player_input.valid_length?
  else player_input.valid_elements?
    end
    print ">"
    turn
  end
end
