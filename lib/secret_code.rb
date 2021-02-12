
class SecretCodeGenerator

   attr_reader :player_code,
               :red_pin_count,
               :white_pin_count
                #:secret_code,


 def initialize(player_code)
  #@secret_code = secret_code
  @player_code = player_code
  @red_pins = Array.new(4)
  @white_pins = Array.new(4)
 end
#
 def generate_code
#   #color_options = ["R", "G", "B", "Y"]
  #@secret_code = ["R", "G", "Y", "B"]
   @secret_code = ["R", "G", "Y", "B"].sample(2) + ["R", "G", "B", "Y"].sample(2)
   end

   def code_comparer(player_code)
    4.times do |count1|
      if @secret_code[count1] == player_code[count1]
        @red_pins[count1] = "red pin"
        #require "pry";binding.pry
        end
         4.times do |count2|
          if @secret_code[count2] == player_code[count1]
            @white_pins[count1] = "white pin"
          else
          end
        end

        p @red_pins
        p @white_pins
        p " "

     end
     #require "pry";binding.pry

      #@pin_count
      #require "pry";binding.pry
   end

   def red_pin_count
     @red_pin_count = @red_pins.count("red pin")
   end

   def white_pin_count
     @white_pin_count = @white_pins.count("white pin") - @red_pins.count("red pin")
   end
end
