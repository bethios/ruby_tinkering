require 'colorize'

class Board
  attr_accessor :board
  attr_accessor :show_board

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def visualize_board
    @show_board = " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} |
#{@board[5]}\n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def is_space_free(spot)
    @board[spot] != @player2 && @board[spot] != @player1
  end

end