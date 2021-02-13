require './lib/secret_code'
require './lib/player_input'
require './lib/code_comparer'
require './lib/game_message'

class Game
  attr_reader :message
  attr_accessor :code_comparer,
                :player_input,
                :secret_code

  def initialize
    @message = Messages.new
    @count = 0
  end


  def start
    @message.welcome
    user_prompt = gets.chomp.downcase
  if user_prompt == 'p'
    @message.intro
    secret_code = SecretCode.new
    secret_code.generate_code
    turn
  elsif user_prompt == 'i'
    @message.instructions
    secret_code = SecretCode.new
    secret_code.generate_code
    turn
  elsif user_prompt == 'q'
    @message.quit
    end
  end

  def turn

    @count += 1
    user_prompt = gets.chomp.downcase
    player = PlayerInput.new(user_prompt)
  if  player.valid_input
    p "You've taken #{@count} guess'"

    end
    print ">"
    turn
  end
end
