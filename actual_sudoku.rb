class Sudoku
  def initialize(board_string)
  end

  def solve!
    # Solves the board
  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board
    # Returns a printed copy of the board
  end

  def check_grid(row=0, col=0, num)
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
