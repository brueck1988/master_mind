4 pegs can be 4 different colors (colors can be repeated if desired.)
White pin if the the correct color is in the wrong place ---color is correct, location is not correct
red pin color and location are correct
No pin - color and location are both incorrect
the computer sets the code
the player tries to break the code
No limit on turns.
Debugger--type in "secret" to see combination "code"


Class for code_generator
  Creates random string of 4 colors. 4 colors are available to choose from. Colors should be able to be duplicated.

Class compares input to code_generator

Class Turn


Class runner file
  User_input

  Extension - Set difficulty --Beginner, intermediate, advanced

Class Message Class
  Output/input to user

Game logic:
Generate random code in string format.

Use one letter to describe each color and postion EX. RGBY, GRYB, etc

player_code = RGBY
computer_code = GRYB

***We need to define position for player_code and computer_code***

4.times do |player_position|
  4.times do |computer_position|
    If computer_code(computer_position) == player_code(player_position)
      return "redpin"
    else 4.times do |computer_position|
        If computer_code(computer_position) != player_code(player_position)
          return "no pin"
        else
        "white pin"
        end
    end
  end
end



output results

player input

compare player input
