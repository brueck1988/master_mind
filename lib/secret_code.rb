class SecretCodeGenerator
  attr_reader :secret_code,
              :pins,
              :player_code

def initialize
  @secret_code = ["R", "G", "B", "Y"]
  @player_code = ["R", "G", "B", "Y"]
  @red_pins = []
end

def generate_code
  #color_options = ["R", "G", "B", "Y"]
  @secret_code = ["R", "G", "B", "Y"]#.sample(2) + ["R", "G", "B", "Y"].sample(2)
  # 4.times do |counter|
  #    rand = ["R", "G", "B", "Y"].sample(random: SecureRandom)
  #    secret_code += rand
  #     end
  #  p secret_code
  end

   def code_comparer
     @pin_count = 0

    4.times do |count1|
      if @secret_code[count1-1] == @player_code[count1-1]
        @pins[count1-1] = "red pin"
          #require "pry";binding.pry
        else 4.times do |count2|
              if @secret_code[count1-1] == @player_code[count2-1]
                @pins[count1-1] = "white pin"
              else
              end
             #end
        end
      end

     end
      @pins
      #@pin_count
      #require "pry";binding.pry
   end
 end
