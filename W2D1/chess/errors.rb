class MoveError < StandardError
  def invalid_start_pos
    puts "No piece at that position"
  end

  def invalid_end_pos
    puts "Cannot move to that position"
  end
end
