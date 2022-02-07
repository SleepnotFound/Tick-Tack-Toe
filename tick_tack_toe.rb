class Players
  attr_reader :name, :piece
  
  def initialize(player_num)
    puts "Enter a name for player #{player_num}"
    @name= gets.chomp
    @piece = set_piece(player_num)
    #puts "Good, #{@name} your piece is: #{@piece}"
  end
  def set_piece(player_num)
    pieces = ["X","O"]
    @piece = pieces[player_num - 1]
  end
end

class Game
  def initialize(p1,p2)
    @p1 = p1
    @p2 = p2
    @cells = [1,2,3,4,5,6,7,8,9]
    @active
    intro
    build_board
    play_round
  end
  def intro
    puts "Welcome #{@p1.name}! \nWelcome #{@p2.name}!"
    @active = [@p1.name,@p2.name].sample
    puts "#{@active} Goes first!"
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
  def play_round
    round_over = false
    unless round_over
      inputing
      finish_round?      
      #round_over = true
    end

  end
  def finish_round?
    #check for winner. if win conditon true, return true
    #check for full board. if full board true. return true

  end
  def inputing
    #accept 1..9. replace board value inputed with players.piece
    puts "#{@active}'s turn! Choose a spot. (enter 1-9)"
    loop do
      input = gets.chomp.to_i
      if (1..9).include?(input) 
        puts "valid number: #{input}"
        #if board already has a piece -> invalid try another spot.
        #if board has empty slot -> insert @actives piece in board
        break
      else puts "invalid choice son. Try again (enter 1-9)"
      end
    end
  end
end
#every game instantiate 2 players and 1 board
p1 = Players.new(1)
p2 = Players.new(2)
game = Game.new(p1,p2)