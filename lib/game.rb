require './lib/secret_code'
require './lib/player_input'
require './lib/code_analyzer'
require './lib/game_message'
require 'time'

class Game
  attr_reader   :message
  attr_accessor :code_comparer,
                :player_input,
                :secret_code

  def initialize
    @secret_code = SecretCode.new.generate_code
    @message     = Messages.new
    @count       = 0
  end

  def start
    @message.welcome
    user_prompt = gets.chomp.upcase
  if user_prompt == 'P'
    @message.intro
    turn
    begin_game_clock
    user_prompt
  elsif user_prompt == 'I'
    @message.instructions
      user_prompt == 'P'
      @message.intro
      turn
      begin_game_clock
  elsif user_prompt == 'Q'
    @message.quit
    user_prompt
  else
    start
    end
  end

  def turn
    @count += 1
    player_guess
    analyzer
    #winner
    # cheater
    end
  end

  def player_guess
    user_prompt = gets.chomp.upcase
    @player_input = PlayerInput.new(user_prompt)

  end

  def analyzer
    if @player_input.valid_input? == true
      p @code = CodeAnalyzer.new(secret_code, @player_input.input)
      @code.code_comparer(secret_code, @player_input.input)
      puts "Your guess '#{@player_input.input.join}' returns #{@code.white_pin_count} white_pins and #{@code.red_pin_count} red pins. \nYou've taken #{@count} guess(es)"
    end
    print ">"
    turn
  end

  def winner
    if @secret_code ==  @player_input.valid_input?
      finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      run_time =  (finish_time - begin_game_clock).to_i
      p "Congratulations! You have have cracked the code #{@player_input.input.join} in #{run_time} seconds using #{@count} guess(es)!!!"
      @message.play_again
      initialize
      start
    end
    # if @player_input == "P"
    #   initialize
    #   start
    # else @player_input == "Q"
    #   @message.quit
    # end
  end

  def begin_game_clock
    @starting_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def cheater
    if @player_input == "S"
      p @secret_code.join
  end
end
