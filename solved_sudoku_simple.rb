require 'debugger'

class Sudoku

  def initialize(board_string)
    @board = []
    board_string.split(//).each {|stringy_number| @board << stringy_number.to_i}
    # debugger
  end

  def is_solved?
    @unsolved_count = @board.select { |num| num.to_i == 0}
    @unsolved_count.length == 0 ? true : false
  end

  def print_board
    for_printing = []
    @board.each_slice(9) { |row| for_printing << row  }
    for_printing.each { |row| puts row.join(" ") }
    puts
  end

 def find_box(index)
    return [(0..2).to_a, (9..11).to_a, (18..20).to_a].flatten if [(0..2).to_a, (9..11).to_a, (18..20).to_a].flatten.include?(index)
    return [(3..5).to_a, (12..14).to_a, (21..23).to_a].flatten if [(3..5).to_a, (12..14).to_a, (21..23).to_a].flatten.include?(index)
    return [(6..8).to_a, (15..17).to_a, (24..26).to_a].flatten if [(6..8).to_a, (15..17).to_a, (24..26).to_a].flatten.include?(index)
    return [(27..29).to_a, (36..38).to_a, (45..47).to_a].flatten if [(27..29).to_a, (36..38).to_a, (45..47).to_a].flatten.include?(index)
    return [(30..32).to_a, (39..41).to_a, (48..50).to_a].flatten if [(30..32).to_a, (39..41).to_a, (48..50).to_a].flatten.include?(index)
    return [(33..35).to_a, (42..44).to_a, (51..53).to_a].flatten if [(33..35).to_a, (42..44).to_a, (51..53).to_a].flatten.include?(index)
    return [(54..56).to_a, (63..65).to_a, (72..74).to_a].flatten if [(54..56).to_a, (63..65).to_a, (72..74).to_a].flatten.include?(index)
    return [(57..59).to_a, (66..68).to_a, (75..77).to_a].flatten if [(57..59).to_a, (66..68).to_a, (75..77).to_a].flatten.include?(index)
    return [(60..62).to_a, (69..71).to_a, (78..80).to_a].flatten if [(60..62).to_a, (69..71).to_a, (78..80).to_a].flatten.include?(index)
  end

  def find_row(index)
    return (0..8).to_a if (0..8).to_a.include?(index)
    return (9..17).to_a if (9..17).to_a.include?(index)
    return (18..26).to_a if (18..26).to_a.include?(index)
    return (27..35).to_a if (27..35).to_a.include?(index)
    return (36..44).to_a if (36..44).to_a.include?(index)
    return (45..53).to_a if (45..53).to_a.include?(index)
    return (54..62).to_a if (54..62).to_a.include?(index)
    return (63..71).to_a if (63..71).to_a.include?(index)
    return (72..80).to_a if (72..80).to_a.include?(index)
  end

  def find_col(index)
    return [0,9,18,27,36,45,54,63,72] if [0,9,18,27,36,45,54,63,72].include?(index)    
    return [1,10,19,28,37,46,55,64,73] if [1,10,19,28,37,46,55,64,73].include?(index)
    return [2,11,20,29,38,47,56,65,74] if [2,11,20,29,38,47,56,65,74].include?(index)
    return [3,12,21,30,39,48,57,66,75] if [3,12,21,30,39,48,57,66,75].include?(index)
    return [4,13,22,31,40,49,58,67,76] if [4,13,22,31,40,49,58,67,76].include?(index)
    return [5,14,23,32,41,50,59,68,77] if [5,14,23,32,41,50,59,68,77].include?(index)
    return [6,15,24,33,42,51,60,69,78] if [6,15,24,33,42,51,60,69,78].include?(index)
    return [7,16,25,34,43,52,61,70,79] if [7,16,25,34,43,52,61,70,79].include?(index)
    return [8,17,26,35,44,53,62,71,80] if [8,17,26,35,44,53,62,71,80].include?(index)
  end

def solve!

  until is_solved?
    # debugger
    @board.each_with_index do |num, index|
      possibles = [1,2,3,4,5,6,7,8,9]
      subtract_array = []
      current_column = find_col(index)
      current_row = find_row(index)   
      current_box = find_box(index)

      if num == 0
        current_row.each {|spot| subtract_array << @board[spot]}
        current_column.each {|spot| subtract_array << @board[spot]}
        current_box.each {|spot| subtract_array << @board[spot]}
        possibles = possibles - subtract_array
        @board[index] = possibles.pop if possibles.length == 1
      end #if

    end #do
  end #until
end #solve

end #class

board_string = File.readlines('sample.unsolved.txt').first.chomp
game = Sudoku.new(board_string)
game.print_board
game.solve!
game.print_board


