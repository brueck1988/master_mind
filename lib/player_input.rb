require './lib/game_message'

class PlayerInput
    attr_reader :input

  def initialize(input)
    @input   = input.upcase.split('')
    @message = Messages.new
  end

  def valid_elements?
    if input.include?("R"||"G"||"Y"||"B")
      true
    else
      false
    end
  end

  def valid_length?
    if input.count == 4
      true
    elsif input.count < 4
      p @message.input_is_too_short
      false
    else input.count > 4
      p @message.input_is_too_short
      false
    end
  end

  def valid_input
    if valid_elements? == true && valid_length? == true
      true
    else
      false
    end
  end
end
