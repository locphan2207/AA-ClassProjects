require 'byebug'
require_relative "board"
require_relative "human_player"
require_relative "display"


class Game
  attr_reader :cur_player, :board
  def initialize(name1="Loc", name2="Nico")
    @board = Board.new
    @player1 = HumanPlayer.new(name1, :white)
    @player2 = HumanPlayer.new(name2, :yellow)
    @cur_player = @player1
  end

  def play
    until board.check_mate?(cur_player.color)
      play_turn
      cur_player = cur_player == @player1 ? @player2 : @player1
    end
  end

  def play_turn
    get_move(cur_player)
  end

  def get_move(cur_player)
    # player can move arrows as long as they want
    # player can select only valid piece
    # player can only drop valid piece in valid location
    display = Display.new(board)
    while true
      display.render

      start_pos = display.cursor.get_input
      end_pos = display.cursor.get_input

      break if move_piece(start_pos, end_pos)
    end
  end
end


if $PROGRAM_NAME == __FILE__
  Game.new.play
end
