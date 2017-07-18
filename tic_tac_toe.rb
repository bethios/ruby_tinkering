require_relative 'game'
require_relative 'board_info'
require_relative 'computer'
require_relative 'player'

board = BoardInfo.new.board
puts board
system "clear"
puts "Welcome to Tic-Tac-Toe!"
game = Game.new
game.set_number_of_players
player = Player.new
player.set_player_markers
game.set_play_order
game.run_game
game.announce_winner
