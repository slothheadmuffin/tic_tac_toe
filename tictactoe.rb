class Player
  def initialize(player,marker)
    @player=player
    @marker=marker
  end
end

class Board
  def initialize
    #grid
    @grid=(1..9).to_a
  end

  def show_board
    puts @grid
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
  end

  def start_game
    @board.show_board
  end

  def change_turn
  end

  def end_game
  end

  def end_stats
  end

end

game=Game.new
game.start_game
#Methods idk where
