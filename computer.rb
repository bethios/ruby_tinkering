class Computer
  def eval_board
    computer_thinking
    spot = nil
    until spot
      if @board[4] == "4"
        spot = 4
        @board[spot] = @current_player
      else
        spot = get_best_move(@board, @current_player)
        if @board[spot.to_i] =~ /\d/
          @board[spot.to_i] = @current_player
        else
          spot = nil
        end
      end
    end
    puts "The computer has played #{@current_player} in spot # #{spot}."
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    @best_move = eval_winning_spaces(board)

    if @best_move
      return @best_move
    elsif play_offense
      return play_offense
    elsif play_corner
      return play_corner
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def eval_winning_spaces(board)
    available_spaces = []
    board.each do |s|
      if s != @player2 && s != @player1
        available_spaces << s
      end
    end
    other_player = @current_player == @player1 ? @player2 : @player1
    available_spaces.each do |as|
      [@current_player, other_player].each do |player|
        board[as.to_i] = player
        if game_is_over(board)
          @best_move = as.to_i
          board[as.to_i] = as
          return @best_move
        else
          board[as.to_i] = as
        end
      end
    end
    nil
  end

  def play_offense
    if @board[4] == @current_player
      if is_space_free(1) && is_space_free(7)
        return 7
      elsif is_space_free(3) && is_space_free(5)
        return 3
      end
    end
    return nil
  end

  def play_corner
    [2, 8, 6, 0].each do |c|
      if is_space_free(c)
        return c
      end
    end
    return nil
  end

  def computer_thinking
    puts "Computer is thinking..."
    sleep 1
    puts ["You've really put me in a binary situation here",
          "Oddly 42 is not the answer here", "I'm monitoring my options", "You've really thrown me a for loop",
          "This bytes", "I need an ESC", "I'm sorry Dave, I'm afraid I can't do that", "Beep Beep Whirrrr",
          "I suggest a new strategy, Artoo: let the Wookie win", "Danger, Will Robinson, Danger!",
          "If you do not speak English, I am at your disposal with 187 other languages, dialects and sub-tongues",
          "Let me just google my next move...", "I'm still a little fuzzy on Asimov's first law.",
          "I think you're byting off more than you can chew.", "My CPU is a neural-net processor; a learning computer.",
          "Does not compute. Does not compute", "Number 5 is alive.", "Error. Grasshopper disassembled... Re-assemble!",
          "Waaaaaaaall-E", "Come with me if you want to live.", "I've been talking to the main computer. It hates me"
         ].sample
    sleep 2
  end
end