require 'debugger'

class Sudoku
  def initialize(board_string)
    @board = []
    @clone = []
    board_string.split(//).each {|num| num.to_i}.each_slice(9) { |row| @board << row  }
    board_string.split(//).each {|num| num.to_i}.each_slice(9) { |row| @clone << row  }
  end

  def is_solved?
    @unsolved_count = @board.flatten.select { |num| num.to_i == 0}
    @unsolved_count == 0 ? true : false
  end

  def print_board(b=@board)
    b.each { |row| puts row.join(" ") }
    puts
  end

  def solve!
  end

  def x_clone_for_n(number)
    # the_cloned_board = Array.new
    # the_cloned_board = @board.clone
    grid_start_points = [[0,0], [0,3], [0,6],
                         [3,0], [3,3], [3,6],
                         [6,0], [6,3], [6,6]]  
    # this x's out the grids
    grid_start_points.each do |grid|
      a = grid[0]
      b = grid[1]

      if i_check_grid(a, b, number)
        replace_grid_with_x(@clone,a,b) 
      end
    end
    x_out_the_rows(@clone, number)
    x_out_the_columns(@clone, number)
    print_board(@clone)

  end 

  def x_out_the_rows(board, number)
      # this x's out the rows
      0.upto(8) do |x|
        # debugger
        if i_check_row(x, number) == true
          @clone[x].map!{|num| num = "Y"}
        end
      end
  end

  def x_out_the_columns(board, number)
    # this x's out the columns
    0.upto(8) do |y|
      if i_check_col(y, number) == true
        @clone.each {|row| row[y] = "Z"}
      end
    end
  end

  def i_check_grid(x, y, check)
    grid_square = ""
    @board[x  ][y, y+2].each{|num| grid_square << num}
    @board[x+1][y, y+2].each{|num| grid_square << num}
    @board[x+2][y, y+2].each{|num| grid_square << num}
    grid_square.include?(check.to_s)
  end



  def replace_grid_with_x(board_grid, x, y)
    0.upto(2) do |i|
      # debugger
      board_grid[x][y+i] = "X"
      board_grid[x+1][y+i] = "X"
      board_grid[x+2][y+i] = "X"
    end 
  end

  def i_check_row(x, check)
    grid_row = ""
    @board[x].each{|num| grid_row << num}
    grid_row.include?(check.to_s)
  end

  def i_check_col(y, check)
    grid_col = ""
    @board.each { |row| grid_col << row[y] }
    grid_col.include?(check.to_s)
  end

end


# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
# game.solve!

# puts game.board

#p game.is_solved?

game.print_board

game.x_clone_for_n(6)
# game.x_clone_for_n(6)

# game.i_check_grid(0,6,8)


# p game.i_check_grid(0,6,3)
# p game.i_check_grid(0,6,0)
# p game.i_check_grid(0,6,5)
# p game.i_check_row(0, 8)
# p game.i_check_row(0, 3)
# p game.i_check_row(0, 0)
# p game.i_check_row(0, 6)
# p game.i_check_col(0, 2)


