require 'colorize'
require_relative 'cursor'

class Display
  attr_accessor :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    # @board[@cursor.cursor_pos].red
    @board.rows.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        if [idx1, idx2] == @cursor.cursor_pos
          if @cursor.selected
            print " #{el.symbol} ".red
          else
            print " #{el.symbol} ".blue
          end
        else
          print " #{el.symbol} "
        end
      end
      puts "" # jump to new line
    end
  end

  def test_cursor
    while true
      system('clear')
      render
      print "Press a key... "
      @cursor.get_input
    end

  end

end
