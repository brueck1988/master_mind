 class CodeAnalyzer
  attr_reader   :red_pins,
                :white_pins,
                :red_pin_count,
                :white_pin_count
  attr_accessor :player_input,
                :secret_code

  def initialize(secret_code, player_input)
    @secret_code   = secret_code
    @player_input  = player_input
    @red_pins      = Array.new(4)
    @white_pins    = Array.new(4)
  end


  def code_comparer(secret_code, player_input)
    4.times do |count1|
    if @secret_code[count1] == player_input[count1]
      @red_pins[count1] = "red pin"
      end
    4.times do |count2|
    if @secret_code[count2] == player_input[count1]
        @white_pins[count1] = "white pin"
      end
    end
  end
    @white_pins
    @red_pins
    output = @white_pins + @red_pins
  end

  def red_pin_count
    @red_pin_count = @red_pins.count("red pin")
  end

  def white_pin_count
    @white_pin_count = @white_pins.count("white pin") - @red_pins.count("red pin")
  end
end
