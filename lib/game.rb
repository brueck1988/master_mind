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
    #turn
  elsif user_prompt == 'i'
    @message.instructions
  elsif user_prompt == 'q'
    @message.quit
    end
  end

  def turn
    @message.intro

    @count += 1
    user_prompt = gets.chomp.downcase
  if user_prompt == #if user prompt is valid (meets conditionals). nested if statements
    p "#{user_input} has #{number} of the correct elements with #{numbers_correct} in the correct positions
     You've taken #{count} guess"
   else
     @message.invalid_guess

      #if user_input is greate than 4 characters or less than 4 characters
    end
  end
end
