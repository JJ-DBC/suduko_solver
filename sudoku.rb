class Sudoku
  def initialize(board_string)
    @board = []
    board_string.split(//).each {|num| num.to_i}.each_slice(9) { |row| @board << row  }
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


  def solve!

  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board

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
