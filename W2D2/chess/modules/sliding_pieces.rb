require 'byebug'
require_relative '../board'

module SlidingPiece
  # create two arrays with horizontal and diagonal directions
  # create moves that returns all possible valid moves
    # use a helper method inside moves that generates all the moves for 1 direction

  HORIZONTAL = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]

  DIAGONAL = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1]
  ]

  def horizontal_dirs
    HORIZONTAL
  end

  def diagonal_dirs
    DIAGONAL
  end

  def moves
    moves = []
    move_dirs.each do |step_pos|
      moves += get_single_move(step_pos)
    end
    moves
  end

  def get_single_move(step_pos)
    row, col = step_pos
    c_row, c_col = pos #current pos
    moves = []
    byebug
    while true
      new_pos = [row + c_row, col + c_col]
      break unless board.in_bounds?(pos)  #break if not valid pos
      if board.empty?(new_pos)
        moves << new_pos # a possibble move is added if new pos is empty
      elsif board[new_pos].color != board[pos].color
        moves << new_pos
        break
      else
        break
      end
    end
    moves
  end
end
