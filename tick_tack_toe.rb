class Players
  attr_reader :name, :piece
  
  def initialize(player_num)
    puts "Enter a name for player #{player_num}"
    @name= gets.chomp
    @piece = set_piece(player_num)
    puts "Good, #{@name} your piece is: #{@piece}"
  end
  def set_piece(player_num)
    pieces = ["X","O"]
    @piece = pieces[player_num - 1]
  end
end

class Game
  def initialize(p1,p2)
    @p1 = p1.name
    @p2 = p2.name
    @cells = [1,2,3,4,5,6,7,8,9]
    intro
    build_board
  end
  def intro
    puts "Welcome #{@p1}! \nWelcome #{@p2}!"
  end
  def build_board
    row = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    row2 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    row3 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    divider = "---+---+---"
    puts row + "\n" + divider + "\n" +
         row2 + "\n" + divider + "\n" +
         row3
  end
end
#every game instantiate 2 players and 1 board
p1 = Players.new(1)
p2 = Players.new(2)
game = Game.new(p1,p2)

#game.intro
#puts "Testing reader: #{p1.piece}"