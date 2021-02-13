require './lib/game'
require './lib/secret_code'
require './lib/player_input'
require './lib/code_analyzer'

class Messages

  def welcome
    puts"Welcome to MASTERMIND!\n\nWould you like to (p)lay\nread the (i)nstructions,\nor (q)uit?"
    print ">"
  end

  def instructions
    puts "    The Object of the game is to crack the secret code.
    The codemaker(computer) will create a 4 letter code using the elements 'RYGB'.
    Elements can be used more than once.
    Your task is to figure out the correct order of the elements.
    The codemaker will inform you of elements in the correct position(means both
    the element and location are correct)or if the elements are correct but in the wrong position."
    puts "Please enter 'p' to play or 'q' to quit"
    print ">"
    user_prompt = gets.chomp.downcase
    if user_prompt == "p"
    else user_prompt == 'q'
      quit
    end
  end

  def quit
    puts "You have quit the game.\n ---Good Bye---"
    exit
  end

  def intro
    puts "I have generated a beginner sequence with four elements made up of:
    (r)ed,(g)reen, (b)lue, and (y)ellow.
    Use (q)uit at any time to end the game.
    What's your guess?"
    print ">"
  end


  def input_is_too_short
    puts "Your element input was too short.\n Please Try Again."
    print ">"
  end

  def input_is_too_long
    puts "Your element input was too long.\n Please Try Again."
    print ">"

  end
end
