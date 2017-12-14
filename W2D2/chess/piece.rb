require 'colorize'
require_relative 'board'
require_relative 'modules/sliding_pieces'
require_relative 'modules/stepable'
require 'singleton'

class Piece

  attr_reader :symbol, :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    raise 'invalid color' unless %i(white yellow).include?(color)
    raise 'invalid pos' unless board.in_bounds?(pos)

    @color, @board, @pos = color, board, pos
    
    board.add_piece(self, pos)
  end

  def filter_check_moves(moves)
    moves.each do |move|
      dup_board = board.dup #use our dup method
      dup_board.move_piece(pos, move)
      moves.delete(move) if dup_board.in_check?(color)
    end
    moves
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = " "
    @color = :none
  end

  def moves
    []
  end
end

class Queen < Piece
  include SlidingPiece

  def symbol
    @symbol = '♛'.colorize(color)
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def moves
    moves = super
    filter_check_moves(moves)
  end
end

class Rook < Piece
  include SlidingPiece

  def symbol
    @symbol = '♜'.colorize(color)
  end

  def move_dirs
    horizontal_dirs
  end

  def moves
    moves = super
    filter_check_moves(moves)
  end
end

class Knight < Piece
  include Stepable

  def symbol
    @symbol = '♞'.colorize(color)
  end

  def move_diffs
    [[-2, -1],
     [-1, -2],
     [-2, 1],
     [-1, 2],
     [1, -2],
     [2, -1],
     [1, 2],
     [2, 1]]
  end

  def moves
    moves = super
    filter_check_moves(moves)
  end
end

class Bishop < Piece
  include SlidingPiece

  def symbol
    '♝'.colorize(color)
  end

  protected

  def move_dirs
    diagonal_dirs
  end

  def moves
    moves = super
    filter_check_moves(moves)
  end
end

class King < Piece
  include Stepable

  def symbol
    '♚'.colorize(color)
  end

  protected

  def move_diffs
    [[-1, -1],
     [-1, 0],
     [-1, 1],
     [0, -1],
     [0, 1],
     [1, -1],
     [1, 0],
     [1, 1]]
  end

  def moves
    moves = super

    # iterate through all pieces
    # select opponent pieces
    # check all moves of each piece
    # remove any of these from King possible moves
    piece_moves = []
    @board.pieces.each do |piece|
      if piece.color != color
        piece_moves += piece.moves
      end
    end

    moves.reject {|move| piece_moves.include?(move)}
  end
end

class Pawn < Piece

  def symbol
    '♟'.colorize(color)
  end

  def moves
    moves = forward_steps + side_attacks
    filter_check_moves(moves)
  end

  private

  def at_start_row?
    pos[0] == (color == :white) ? 6 : 1
  end

  def forward_dir
    color == :white ? -1 : 1
  end

  def forward_steps
    i, j = pos
    one_step = [i + forward_dir, j]
    return [] unless board.in_bounds?(one_step) && board.empty?(one_step)

    steps = [one_step]
    two_step = [i + 2 * forward_dir, j]
    steps << two_step if at_start_row? && board.empty?(two_step)
    steps
  end


  def side_attacks
    i, j = pos
    side_moves = [[i + forward_dir, j - 1], [i + forward_dir, j + 1]]

    side_moves.select do |new_pos|
      next false unless board.in_bounds?(new_pos)
      next false if board.empty?(new_pos)

      threatened_piece = board[new_pos]
      threatened_piece && threatened_piece.color != color
    end
  end
end
