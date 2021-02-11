class SecretCodeGenerator
  attr_reader :secret_code,
              :red_pins,
              :player_code,
              :white_pins

def initialize
  @secret_code = ["Y", "G", "B", "B"]
  @player_code = ["R", "G", "B", "Y"]
  @red_pins = Array.new(4)
  @white_pins = Array.new(4)
end

 def generate_code
#   #color_options = ["R", "G", "B", "Y"]
#   @secret_code = ["R", "G", "Y", "B"]#.sample(2) + ["R", "G", "B", "Y"].sample(2)
#   # 4.times do |counter|
#   #    rand = ["R", "G", "B", "Y"].sample(random: SecureRandom)
#   #    secret_code += rand
#   #     end
#   #  p secret_code
   end

   def code_comparer
    4.times do |count1|
      if @secret_code[count1] == @player_code[count1]
        @red_pins[count1] = "red pin"
        end
         4.times do |count2|
          if @secret_code[count2] == @player_code[count1]
            @white_pins[count1] = "white pin"
          else
          end
        end
        p @red_pins
        p @white_pins
        p " "

     end


      #@pin_count
      #require "pry";binding.pry
   end
 end
