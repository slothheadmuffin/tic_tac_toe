class Player
  def initialize(player,marker)
    @player=player
    @marker=marker
  end
  def to_s
    @player
  end
end

class Board
  def initialize
    @grid=(1..9).to_a
  end
  
  def show_board
    puts "\n"
    @grid.each_slice(3){ |row| puts row.join(' ')}
  end
  
  def valid_move
  end
  
  def full_board
  end
  
  def wins
    
  end
  
end

class Game
  def initialize
    @board=Board.new
    @current_player=0
  end

  def obtain_players
    puts "Tic Tac Toe"
    puts "\nPlayer 1, type you name"
    player1= gets.chomp
    puts  "\nChoose your marker X or O"
    marker1=gets.chomp.upcase
    while marker1 != "X" && marker1 != "O"
      puts "Choose a valid marker, X or O"
      marker1=gets.chomp.upcase
    end
    puts "\nPlayer 2, type your name"
    player2=gets.chomp
    marker1 =="X" ? marker2="O" : marker2="X"
    @player1=Player.new(player1,marker1)
    @player2=Player.new(player2,marker2)
    puts "\n#{player1} is first player with mark #{marker1}"
    puts "#{player2} is second player with mark #{marker2}"
    @current_player=player1
  end

  def start_game
    obtain_players
    @board.show_board
  end

  def change_turn
  end

  def end_game
  end

  def end_stats
    @board.show_board
  end

end

game=Game.new
game.start_game
#Methods idk where
