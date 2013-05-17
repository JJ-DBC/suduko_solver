class Sudoku
  def initialize(board_string)
    @board = []
    board_string.split(//).each {|num| num.to_i}.each_slice(9) { |row| @board << row  }
    @grid_box = [0,0,0,3,0,6,3,0,3,3,3,6,6,0,6,3,6,6]
    @possible_numbers = %w{1 2 3 4 5 6 7 8 9}

  end


  def is_solved?
    @unsolved_count = @board.flatten.select { |num| num.to_i == 0}
    if @unsolved_count == 0
      return true
    else
      return false
    end
  end

  def print_board
    @board.each { |row| puts row.join(" ") }
  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board
    # Returns a printed copy of the board
  end 

  def fill_empty_cells

    @board.each do |row|
      row.map {}


  end
  def check_grid(row=0, col=1)


    # if row, col are end of array & num == 9 return @board
    # counter += 1
    # until counter == 3
    @board.check_row(row, col)
      # IF check_row? == true
        # check_grid(0, col += 3, num)
      # ELSIF false
        check_col()
        # check the next row (row += 1, col = 0)
      # ELSE check row, check col 
        # if check row and check col DO NOT have num, place num
        # if check row OR check col HAVE num, move to next grid

    # check 3 squares across row (increment column)
    # increment row +=1
    # check 3 squares across next row 
    # end first iteration with col 2
    # want next iteration to start with col 3
  end 

  def check_row?(row, col, num)
    # incremements column
    # while index < length
    # true = num present 
    # false = num not present
  end

  def check_col?(row, col, num)
    # incremements row
    # while index < length
    # true/false
  end 

  # def n_board(num)
  #   n_board = @board.clone
  #   n_board.map do |row| 
  #     row.map do |col| 
  #       col.gsub!(/[1-9]/, 'X')
  #       col.gsub!('0', '')
  #     end
  #   end

  #   n_board.clear
  # end 

end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
game.solve!

puts game.board
