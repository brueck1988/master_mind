require './lib/secret_code'
require './lib/player_input'
require './lib/code_analyzer'
require './lib/game_message'
require 'time'

class Game
  attr_reader :message
  attr_accessor :code_comparer,
                :player_input,
                :secret_code

  def initialize
    @message = Messages.new
    @count = 0
    @secret_code = SecretCode.new.generate_code
  end

  def start
    @message.welcome
    user_prompt = gets.chomp.upcase
  if user_prompt == 'P'
    @message.intro
    turn
    user_prompt = gets.chomp.upcase
  elsif user_prompt == 'I'
    @message.instructions
    turn
    user_prompt = gets.chomp.upcase
  elsif user_prompt == 'Q'
    @message.quit
  else
    start
    end
  end

  def turn
    @count += 1
    begin_game_clock
    user_prompt = gets.chomp.upcase
    @player_input = PlayerInput.new(user_prompt)
    if player_input.valid_input?
      analyzer
     guess_out_put
    # elsif @player_input == "q"
    #   @message.quit
    secret_code == @player_input.input
      winner
      end
    print ">"
    turn
    end
  end

  def analyzer
    p @code = CodeAnalyzer.new(secret_code, @player_input.input)
    @code.code_comparer(secret_code, @player_input.input)
  end

  def guess_out_put
    puts "Your guess '#{@player_input.input.join}' returns #{@code.white_pin_count} white_pins and #{@code.red_pin_count} red pins. \nYou've taken #{@count} guess(es)"
  end


  def begin_game_clock
    @starting_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def cheater
    if user_prompt == "SECRET"
      p @secret_code
  end


  def winner
      finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      run_time =  (finish_time - @starting_time).to_i
      p "Congratulations! You have have cracked the code #{@player_input.input.join} in #{run_time} seconds using #{@count} guess(es)!!!"
      p "Would you like to play again? Press (P) to play again or (Q) to quit."
      user_prompt = gets.chomp.upcase
      if @player_input == "P"
        start
      elsif @player_input == "Q"
        @message.quit
      end
    end
  end
