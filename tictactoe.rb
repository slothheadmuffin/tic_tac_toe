class Game
    def initialize
        @board=Board.new
        @current_player=0
       
    end

    def obtain_players
        puts "Player 1, what is your name?"
        player=gets.chomp
        puts "Choose your mark X or O"
        tic=gets.chomp.upcase
        while tic != "X" && tic != "O"
            puts "Invalid mark, choose X or O"
            tic=gets.chomp.upcase
        end
        puts "Player 2, what is your name?"
        player2=gets.chomp
        tic2= tic== "X" ? "O" : "X"

        @player1=Player.new(player,tic)
        @player2=Player.new(player2,tic2)
        puts "#{player} is Player 1 with mark #{tic}"
        puts "#{player2} is Player 2 with mark #{tic2}"
        @current_player=@player1
    end
    def start_game
       puts "Tic Tac Toe" 
       loop do
            obtain_players
            @board.board_reset
            #aqui va el loop
            loop do
                place_tic
                if game_finish
                    @board.board_show
                    winner
                    break
                end
                change_turn
            end
            puts "Wanna play again? Y/N"
            response=gets.chomp.upcase
            break unless response =="Y"
        end
        puts "Thanks for playing"
    end
    def place_tic
        #the player selects a number 
        loop do
            puts "#{@current_player} Select a number to place your marker"
            @board.board_show
            position=gets.chomp.to_i
            if @board.valid_move?(position)
                @board.board_update(position,@current_player.tic)
                break
            else
                puts "Choose a valid move"
            end
        end
    end

    def change_turn
        #alterna entre jugadores
        if @current_player==@player1
            @current_player=@player2
        else
            @current_player=@player1
        end
    end



    def game_finish
        @board.has_won?(@current_player.tic)||@board.board_full?
    end
    def winner
        if @board.has_won?(@current_player.tic)
            puts "Player #{@current_player} wins"
        else
            puts "it's a tie"
        end
    end
end

class Player
    attr_reader :tic
    def initialize(player,tic)
        @tic=tic # X or O
        
        @player=player
    end
    def to_s
        @player
    end
end

class Board
    def initialize
        #grid con numeros del 1 al 9
        @grid=(1..9).to_a
    end
    def board_reset
        #grid con numeros del 1 al 9
        @grid=(1..9).to_a
    end

    def board_show
        #se imprime el tablero despues de que el jugador pone su pieza
        @grid.each_slice(3){|row| puts row.join(" ")}
    end


    def valid_move?(position)
        #number selected is between boundaries and not occupied
        position.between?(1,9) && @grid[position-1].is_a?(Integer)
       
    end

    def board_update(place,tic)
        #actualiza el tablero despues de un movimiento
        @grid[place-1]=tic
    end

    def board_full?
        #Si todas las posiciones son string en vez de numeros
        @grid.all?{|pos| pos.is_a?(String)}
    end
    def has_won?(tic)
        winning_combos = [
            [0,1,2], [3,4,5], [6,7,8],  # Rows
            [0,3,6], [1,4,7], [2,5,8],  # Columns
            [0,4,8], [2,4,6]            # Diagonals
        ]
    
        winning_combos.any? do |combo|
            combo.all? { |position| @grid[position] == tic }
        end
    end
end

game=Game.new
game.start_game