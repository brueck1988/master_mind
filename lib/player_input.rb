require './lib/game_message'

class PlayerInput
    attr_reader :input

  def initialize(input)
    @input   = input.upcase.split('')
    @message = Messages.new
  end

  def valid_elements?
    if element_include_rgyb
      true
    else !element_include_rgyb
      @message.invalid_element
      false
    end
  end

  def element_include_rgyb
    input.all? do |character|
    character == "R"||character == "G"||character == "Y"|| character == "B"
    end
  end

  def valid_length?
    if input.count == 4 
      true
    elsif input.count > 4
       @message.input_is_too_long
    else input.count <  4
       @message.input_is_too_short
    end
  end

  def valid_input?
    if valid_elements? == true && valid_length? == true
      true
    else
      false
    end
  end
end
