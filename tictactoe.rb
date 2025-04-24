class Player
  def initialize(player,marker)
    @player=player
    @marker=marker
    @current_player=0
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
  end

  def obtain_players
    puts "Tic Tac Toe"
    puts "\nPlayer 1, type you name"
    player= gets.chomp
    puts  "\nChoose your marker X or O"
    marker=gets.chomp.upcase
    while marker != "X" && marker!="O"
      puts "Choose a valid marker, X or O"
      marker=gets.chomp.upcase
    end
    @player1=Player.new(player,marker)
    puts @player1
    #not finished
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
