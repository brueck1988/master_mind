require './lib/game'
require './lib/secret_code'
require './lib/player_input'
require './lib/code_analyzer'

class Messages
  def welcome
    puts " \n"
    puts"Welcome to MASTERMIND!\n\nWould you like to (P)lay,\nread the (I)nstructions,\nor (Q)uit?"
    print ">"
  end

  def instructions
    puts "    The object of the game is to crack the secret code.
    The codemaker(computer) will create a 4 letter code using only the letters 'RYGB'.
    Letters can be used more than once, or not at all.
    Your task is to figure out both which letters are used in the secret code, and in which order.
    If a letter is not found in the secret code, no pin will be returned.
    If a letter is in the wrong position but is used in the secret code, the codemaker will return a white pin.
    If the correct letter is in the correct position, the codemaker will return a red pin."

    puts "\nPlease enter 'P' to play or 'Q' to quit"
    print ">"
    user_prompt = gets.chomp.upcase
    if user_prompt == "P"
    else user_prompt == 'Q'
      quit
    end
  end

  def quit
    puts "\nYou have quit the game.\n---Good Bye---\n"
    exit
  end

  def intro
    puts "\n"
    puts "I have generated a beginner sequence with four elements made up of:
    (R)ed,(G)reen, (B)lue, and (Y)ellow.
    Press (Q)uit at any time to end the game.
    What's your guess?"
    print ">"
  end

  def input_is_too_short
    puts "Your element input was too short.\nPlease Try Again."
  end

  def input_is_too_long
    puts "Your element input was too long.\nPlease Try Again."
  end

  def invalid_element
    puts "Your element input does not exist\nPlease Try Again."
  end

  def play_again
    puts "Would you like to play again? Press (P) to play again or (Q) to quit."
  end
end
