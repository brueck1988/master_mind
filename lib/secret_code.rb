class SecretCodeGenerator
  attr_reader :secret_code,
              :pins,
              :player_code

def initialize
  @secret_code = secret_code
  @player_code = ["R", "G", "B", "Y"]
  @pins = Array.new(4)
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
    4.times do |player_position|
      4.times do |computer_position|
        #require "pry";binding.pry
        if @secret_code[computer_position] == @player_code[player_position]
          @pins[computer_position] = "redpin"
        else 4.times do |computer_position|
              if @secret_code[computer_position] != @player_code[player_position]
                @pins = "no pin"
              else
                    @pins[computer_position] = "white pin"
              end
             end
        end

      end

     end
     require "pry";binding.pry
      @pins
   end
 end
