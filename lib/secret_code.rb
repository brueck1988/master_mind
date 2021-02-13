class SecretCode
  attr_reader :secret_code

  def initialize
    @secret_code = []
  end

  def generate_code
    elements = ["R", "G", "Y", "B"]
    @secret_code = 4.times.map do
      elements.shuffle[0]
    end
  end
end
