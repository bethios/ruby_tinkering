class Game
  def initialize
  end

  def set_number_of_players
    puts "One Player or Two Player Game? (enter 1 or 2) Or Computer Death Match! (enter 0)"
    @number_players = nil
    until @number_players
      @number_players = gets.chomp
      if @number_players.length != 1 || @number_players =~ /[^012]/
        puts "Oops, please choose 0, 1 or 2 players"
        @number_players = nil
      end
    end
  end

  def set_play_order
    @current_player = nil
    puts "Who should go first? Player 1 or 2. Or make it random? (1,2,R)"
    until @current_player
      @current_player = gets.chomp
      if @current_player.length != 1 || @current_player =~ /[^12R]/i
        puts "Oops! Type 1 2 or R to select who goes first"
        @current_player = nil
      end
    end

    @current_player = if @current_player == '1'
                        @player1
                      elsif @current_player == '2'
                        @player2
                      else
                        [@player1, @player2].sample
                      end
  end

  def run_game
    puts @show_board
    until is_game_over(@board) || is_tie(@board)
      puts "Its #{@current_player}'s turn"
      if @number_players.to_i == 0
        evaluate_board
      elsif @number_players.to_i == 1
        @current_player == @player1 ? humans_turn : evaluate_board
      else
        humans_turn
      end
       puts @show_board
      @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
  end

  def announce_winner
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    result = is_game_over(@board) ? "Game over, #{@current_player}'s win!" : "Its a tie!"
    puts result
  end

  def is_game_over(board)
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def is_tie(b)
    b.all? { |s| s == @player2 || s == @player1 }
  end



end

