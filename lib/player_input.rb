class PlayerInput
    attr_reader :input

  def initialize(input)
    @input = input.upcase.split('')
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
    else 
      false
    end
  end
end
