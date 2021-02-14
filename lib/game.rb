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
      begin_game_clock
      turn
      user_prompt
    elsif user_prompt == 'I'
      @message.instructions
        user_prompt == 'P'
        @message.intro
        begin_game_clock
        turn
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
    cheater
    quitter
    analyzer
  end

  def player_guess
    @user_prompt = gets.chomp.upcase
    @player_input = PlayerInput.new(@user_prompt)
    puts "\n"
  end

  def analyzer
    if @player_input.valid_input? == true
      @code = CodeAnalyzer.new(secret_code, @player_input.input)
      @code.code_comparer(secret_code, @player_input.input)
      puts "Your guess '#{@player_input.input.join}' returns #{@code.white_pin_count} white_pins and #{@code.red_pin_count} red pins. \nYou've taken #{@count} guess(es)"
    else
      @count -= 1
    end
    if @secret_code == @player_input.input
      winner
    end
    print ">"
    turn
  end

  def winner
    end_game_clock
    puts "\n"
    puts "Congratulations!!! You have have cracked the code '#{@player_input.input.join}' in #{@minutes} minutes, #{@seconds} seconds using #{@count} guess(es)!"
    @message.play_again
    user_prompt = gets.chomp.upcase
    if user_prompt == "P"
      initialize
      start
    else user_prompt == "Q"
      @message.quit
    end
  end

  def begin_game_clock
    @starting_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def end_game_clock
    finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    run_time =  (finish_time - @starting_time)
    @minutes = run_time.to_i / 60
    @seconds = (run_time % 60).truncate(2)
  end

  def quitter
    if @user_prompt == "Q"
      @message.quit
    end
  end

  def cheater
    if @user_prompt == "S"
      p @secret_code.join
      puts "\n"
    end
  end
end
