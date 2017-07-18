require 'colorize'

class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
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

  def set_player_markers
    if @number_players.to_i.zero?
      @player1 = 'X'
      @player2 = 'O'
    else
      puts "You can be X or O or choose a different letter!"
      puts "Player 1: What marker would you like to use?"
      @player1 = pick_players_markers
    end

    if @number_players.to_i == 2
      puts "Player 2: What marker would you like to use?"
      @player2 = pick_players_markers
    elsif @number_players.to_i == 1
      @player2 = @player1 =~ /[X]/i ? 'O' : 'X'
    end

    @player1 = @player1.upcase.light_red
    @player2 = @player2.upcase.green
    puts "Great! Player 1 is #{@player1}, Player 2 is #{@player2}"
  end

  def pick_players_markers
    marker = nil
    until marker
      marker = gets.chomp
      if marker == @player2 || marker == @player1
        puts "Oops. That marker is already taken, please choose again."
        marker = nil
      elsif marker.length != 1 || marker =~ /[^A-Z]/i
        puts "Oops. Please select a single letter to be your marker"
        marker = nil
      end
    end
    marker
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

  def start_game
    show_board
    until game_is_over(@board) || tie(@board)
      puts "Its #{@current_player}'s turn"
      if @number_players.to_i == 0
        eval_board
      elsif @number_players.to_i == 1
        @current_player == @player1 ? humans_turn : eval_board
      else
        humans_turn
      end
      show_board
      @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
  end

  def finish_game
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    result = game_is_over(@board) ? "Game over, #{@current_player}'s win!" : "Its a tie!"
    puts result
  end

  def is_space_free(n)
    @board[n] != @player2 && @board[n] != @player1
  end

  def game_is_over(b)
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == @player2 || s == @player1 }
  end

  def show_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]}\n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end


end

