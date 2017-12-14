class TowersOfHanoi
  attr_reader :start_tower, :end_tower, :extra_tower
  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(start, destination)
    raise "Empty tower" if @towers[start].empty?
    raise "Bad disk order" if !@towers[destination].empty? &&
      @towers[start].last > @towers[destination].last
    @towers[destination] << @towers[start].pop
  end

  def get_input
    puts "Enter start tower:"
    start = gets.chomp.to_i
    puts "Enter destination tower:"
    destination = gets.chomp.to_i
    [start, destination]
  end

  def won?
    @towers[1].length == 3
    puts "You won!"
  end

  def [](value)
    @towers[value]
  end

  def play
    until won?
      start, destination = get_input
      move(start, destination)
    end
  end
end
