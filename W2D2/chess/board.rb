require_relative "piece"
require_relative "errors"

class Board
  attr_accessor :rows

  def initialize(fill_board = true)
    @sentinel = NullPiece.instance #because of singletin
    make_starting_grid(fill_board)
    set_pieces
  end

  def set_pieces
    #Add pawns:
    @rows[1].each_index do |idx2|
      Pawn.new(:white, self, [1,idx2])
    end
    @rows[6].each_index do |idx2|
      Pawn.new(:yellow, self, [6,idx2])
    end

    #Add kings:
    King.new(:white, self, [0,4])
    King.new(:yellow, self, [7,4])

    #Add queens:
    Queen.new(:white, self, [0,3])
    Queen.new(:yellow, self, [7,3])

    #Add bishops:
    Bishop.new(:white, self, [0,2])
    Bishop.new(:white, self, [0,5])
    Bishop.new(:yellow, self, [7,2])
    Bishop.new(:yellow, self, [7,5])

    #Add knights:
    Knight.new(:white, self, [0,1])
    Knight.new(:white, self, [0,6])
    Knight.new(:yellow, self, [7,1])
    Knight.new(:yellow, self, [7,6])

    #Add rooks:
    Rook.new(:white, self, [0,0])
    Rook.new(:white, self, [0,7])
    Rook.new(:yellow, self, [7,0])
    Rook.new(:yellow, self, [7,7])

  end

  def make_starting_grid(fill_board)
    @rows = Array.new(8) { Array.new(8, @sentinel) } #initial positions
  end

  def add_piece(piece, pos)
    raise 'position not empty' unless empty?(pos)

    self[pos] = piece
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].class == NullPiece
      raise MoveError.new.invalid_start_pos
    end

    if self[end_pos].class != NullPiece
      raise MoveError.new.invalid_end_pos
    end
    #Move stuff here:
    return false unless valid_move?
    self[end_pos] = self[start_pos]
    self[start_pos] = @sentinel
    true
  end

  def valid_move?(start_pos, end_pos)
    return false unless self[start_pos].moves.include?(end_pos)
    true
  end

  def in_bounds?(pos)
    return false unless self[pos]
    true
  end

  def dup
    new_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.pos)
    end

    new_board
  end

  def empty?(pos)
    self[pos].is_a?(NullPiece)
  end

  def pieces
    @rows.flatten.reject {|piece| piece.is_a?(NullPiece)}
  end

  def find_king(color)
    king = @rows.flatten.detect { |el| el.color == color && el.is_a?(King) }
    king.pos
  end

  def in_check?(color)
    pieces.each do |piece|
      if piece.color != color && piece.moves.include?(find_king(color))
        return true
      end
      false
    end
  end

  def check_mate?(color)
    if in_check?(color) && @board.empty?(find_king(color))
      return true
    end
    false
  end
end
