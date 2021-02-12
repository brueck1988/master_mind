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

  def player_input(string)
    (player_guess == "r") ||  (player_guess == "y") || (player_guess == "g") ||(player_guess == "b")
  end

  def turn
    @message.intro
    #generate computer code
    @count += 1
    user_prompt = gets.chomp.downcase
  if  player_input == true #@player.valid_guess #if user inputs is valid (meets conditionals). nested if statements?
    #how do we store their previous guess? in some sort of board with arrays. in a guess?
    #must find a way to return the number of correct elements and if any are in the correct position
    p "player_guess has number has to compare to computer.generated_code of the correct elements with ___ in the correct positions
     You've taken #{count} guess"
     turn
   else
     @message.input_is_to_long
     @message.input_is_to_short
      #if player.invalid_guess is greater than 4 characters or less than 4 characters

    end
  end
end
