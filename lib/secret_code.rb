require './lib/game'

class SecretCode
  attr_reader :secret_code

  def initialize
    @secret_code = []
    @difficulty_input = gets.chomp.upcase
  end

  def generate_code
    #require "pry";binding.pry
    if @difficulty_input == "B"
      elements = ["R", "G", "Y", "B"]
      @secret_code = 4.times.map do
      elements.shuffle[0]
      end
    elsif @difficulty_input == "I"
      elements = ["R", "G", "Y", "B", "O"]
      @secret_code = 6.times.map do
      elements.shuffle[0]
      end
    elsif @difficulty_input == "A"
      elements = ["R", "G", "Y", "B", "O", "P"]
      @secret_code = 8.times.map do
      elements.shuffle[0]
    else
      end
    end
  end
end
