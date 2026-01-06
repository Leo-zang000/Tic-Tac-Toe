require_relative("counter.rb")

class Board
  def initialize()
    @dimensions = 3
    @positions_filled = 0
    @positions_matrix = Array.new(3, Array.new(3, "*"))
  end
  def add_counter(counter)
    @positions_matrix[counter.y_pos?][counter.x_pos?] = counter.type?
  end
  def display()
    puts ("   1  2  3")
    0.upto(2) do |line_num|
      print ((line_num+1).to_s + "  ")
      0.upto(2) do |column_num|
        print (@positions_matrix[line_num][column_num] + "  ")
      end
      print "\n"
    end
  end
end