require 'Math'

class KnightPathFinder

  def initialize(starting, target)
    @start = start
    @target = targer
    @board = Array.new(8) { Array.new(8) }
    @possible_paths = [start]
    @positions_vistied = [start]
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

  def possible_move?(start, stop)
    ((start[0] - stop[0]).abs == 2 && (start[1] - stop[1]).abs == 1) ||
    ((start[0] - stop[0]).abs == 1 && (start[1] - stop[1]).abs == 2)
  end

  def get_possible_moves(pos)
    possible_moves = []
    @board.each_index do |idx|
      row.each_index do |jdx|
        possible_moves << [idx, jdx] if possible_move(pos, [idx, jdx])
      end
    end
    possible_moves
  end

  def run
    possible_moves = get_possible_moves(@start)
    puts possible_moves
  end
end

knight = KnightPathFinder.new([0, 0], [3, 2])
knight.run
