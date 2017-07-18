class Player
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