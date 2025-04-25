class Player
  attr_reader :marker
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
  def reset_board
    @grid=(1..9).to_a
  end
  def show_board
    puts "\n"
    @grid.each_slice(3){ |row| puts row.join(' ')}
  end
  
  def valid_move?(move)
    move.between?(1,9) && @grid[move-1].is_a?(Integer)
  end
  
  def update_board(place,marker)
    @grid[place-1]=marker

  end
  def full_board?
    @grid.all?{|position| position.is_a?(String)}
  end
  
  def wins?(marker)
    combinations=[
      [0,1,2],[3,4,5],[6,7,8], #row
      [0,3,6],[1,4,7],[2,5,8], #column
      [0,4,8],[2,4,6] #diagonal
    ]
    combinations.any? do |winning|
      winning.all?{|combo|@grid[combo]==marker} 
    end
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
    @current_player=@player1
  end

  def start_game
    loop do
      
      obtain_players
      @board.reset_board
      loop do
        place_marker
        if end_game
          stats_end
          break 
        end
        change_turn
      end
      puts "Wanna play again? Y/N"
      response=gets.chomp.upcase
      break unless response =="Y"
    end
  end
  
  def place_marker
    loop do 
      puts "\n#{@current_player} Choose a number between 1-9 to place marker"
      @board.show_board
      move=gets.chomp.to_i

      if @board.valid_move?(move)
        @board.update_board(move,@current_player.marker)
        break
      else
        puts "\nChoose a valid move"
      end
    end
  end

  def change_turn
    if @current_player==@player1
      @current_player=@player2
    else
      @current_player=@player1
    end
  end

  def end_game
    @board.full_board?||@board.wins?(@current_player.marker)
  end

  def stats_end
    if @board.wins?(@current_player.marker)
      puts "\n#{@current_player} wins"
    else
      puts "It's a tie"
    end
    @board.show_board
  end

end

game=Game.new
game.start_game
#Methods idk where
