class Player
  attr_accessor :number_players

  def initialize
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

  def humans_turn
    puts "Enter [0-8] to select your spot"
    spot = nil
    until spot
      spot = gets.chomp
      if spot =~ /[^0-8]/
        puts "Oops, please choose again, spot must be between 0 and 8!"
        spot = nil
      elsif is_space_free(spot.to_i)
        @board[spot.to_i] = @current_player
      else
        puts "Oops, that spot is already taken! Please choose again."
        spot = nil
      end
    end
  end
end