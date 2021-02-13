require './lib/game_message'

class Game
  attr_reader :message

  def initialize
    @message = Messages.new
    @count = 0
  end


  def start
    @message.welcome
    user_prompt = gets.chomp.downcase
  if user_prompt == 'p'
    turn
  elsif user_prompt == 'i'
    @message.instructions
  elsif user_prompt == 'q'
    @message.quit
    end
  end

  def turn
    @message.intro
    #generate computer code
    @count += 1
    user_prompt = gets.chomp.downcase
  if  player_input == true
    p "player_guess has number has to compare to computer.generated_code of the correct elements with ___ in the correct positions
     You've taken #{count} guess"
   else
      
    end
  end
end
