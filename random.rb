require 'securerandom'
computer_code = ""
4.times do |counter|
   rand = ["R", "G", "B", "Y"].sample(random: SecureRandom)
   #require "pry"; binding.pry
   computer_code += rand
 end

 print computer_code
