require_relative "piece"
require_relative "errors"
class Board
  attr_accessor :grid
  NULL_PIECE = NullPiece.new #because of singleton

  def self.default_board
    grid = Array.new(8) {Array.new(8){NULL_PIECE}}
    grid.each_with_index do |row, idx|
      row.map! {Piece.new()} if [0,1,6,7].include?(idx)
    end
    grid
  end

  def initialize(board = self.class.default_board)
    @grid = board
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].class == NullPiece
      raise MoveError.new.invalid_start_pos
    end

    if self[end_pos].class != NullPiece
      raise MoveError.new.invalid_end_pos
    end
    #Move stuff here:
    self[end_pos] = self[start_pos]
    self[start_pos] = NULL_PIECE
  end

  def in_bounds(pos)
    return false unless self[pos]
    true
  end
end
