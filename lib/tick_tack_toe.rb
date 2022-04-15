class Players
  attr_reader :name, :piece

  def initialize(player_num)
    puts "Enter a name for player #{player_num}"
    @name = gets.chomp
    @piece = set_piece(player_num)
  end

  def set_piece(player_num)
    pieces = %w[X O]
    pieces[player_num - 1]
  end
end

class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @active = nil
    intro
    build_board
    play_round
  end

  def intro
    puts "Welcome #{@p1.name}! \nWelcome #{@p2.name}!"
    @active = [@p1, @p2].sample
    puts "#{@active.name} Goes first!"
  end

  def build_board
    row1 = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    row2 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    row3 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    divider = '---+---+---'
    puts row1 + "\n" + divider + "\n" +
         row2 + "\n" + divider + "\n" +
         row3
  end

  def play_round
    @game_over = false
    until @game_over
      inputing
      continue_game
      if @game_over
        puts 'Play Again? (Y/N)'
        play_again
      else
        @active = @active == @p1 ? @p2 : @p1
      end
    end
  end

  def continue_game
    win_condition = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    if @cells.all?(String)
      puts 'Tie!'
      @game_over = true
    end
    win_condition.each do |win|
      next unless win.all? { |i| @cells[i] == @active.piece }

      puts "Winner winner chicken dinner: #{@active.name}!"
      @game_over = true
      break
    end
  end

  def inputing
    puts "#{@active.name}'s turn! Choose a spot. (enter 1-9)"
    loop do
      input = gets.chomp.to_i
      if (1..9).include?(input)
        if @cells[input - 1].is_a? Numeric
          @cells[@cells.index(input)] = @active.piece
          build_board
          break
        else
          puts 'Spot already taken! Try again.'
        end
      else
        puts 'invalid choice. Try again (enter 1-9)'
      end
    end
  end

  def play_again
    choice = gets.chomp.downcase
    if choice == 'y'
      p1 = Players.new(1)
      p2 = Players.new(2)
      Game.new(p1, p2)
    else
      puts 'Thanks for playing!'
    end
  end
end

p1 = Players.new(1)
p2 = Players.new(2)
Game.new(p1, p2)
