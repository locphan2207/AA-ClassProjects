class Game

  attr_reader :fragment, :dictionary

  def initialize(players, fragment)
    @players = players
    @fragment = fragment
    @dictionary = File.readlines("dictionary.txt")
  end

  def play_round

  end

  def current_player
  end

  def previous_playor
  end

  def next_player!
  end

  def take_turn(player)
  end

  def valid_play?(string)
  end


end


class Player
  attr_reader :name, :guess

  def initialize(name)
    @name = name
  end

  def guess
    puts "What letter would you like to add?"
    @guess = gets.chomp.downcase

    while alert_invalid_guess?
    end
  end

  def alert_invalid_guess?()
    if @guess.ord >= 'a'.ord && @guess.ord <= 'z'.ord #check if its a letter
      true
    end
    false
  end
end
