module SlidingPiece
  def moves #return all posible moves

    case self.class
    when Queen
      directions = move_dirs
    when Rook

    when Knight

    end
    # return an array of places a piece can move
  end

  private
  def move_dirs
    [[-1,0], [1,0], [0,-1], [0,1],  
    ]
  end
end

@move_direction =
inital_position
[0, 0]
