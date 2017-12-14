class Piece
  attr_reader :symbol

  def initialize(value="Piece")
    @symbol = value
  end
end

class NullPiece < Piece
  def initialize
    @symbol = "empty"
  end
end

class Queen < Piece
  def initialize
    @symbol = '♕' #color == WHITE ? '♕' : '♛'
  end
  def move_dirs
    [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, 1], [1, -1], [-1, -1]] #all the directions
  end
end

class Rook < Piece
  def move_dirs
    [[1, 0], [-1, 0], [0, 1], [0, -1]]
  end
end

class Knight < Piece
  def move_dirs

  end
end
