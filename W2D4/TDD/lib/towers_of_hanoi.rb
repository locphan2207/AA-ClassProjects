class Towers

attr_accessor :board

  def initialize
    @board = [[1,2,3],[],[]]
  end

  def move(from_tower,to_tower)
    @board[to_tower].unshift(@board[from_tower].shift)
  end

  def won?
    return true if @board[1] == [1,2,3] || @board[2] == [1,2,3]
    false
  end

  
end
