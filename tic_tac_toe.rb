require_relative 'game'

game = Game.new
system "clear"
puts "Welcome to Tic-Tac-Toe!"
game.set_number_of_players
game.set_player_markers
game.set_play_order
game.start_game
game.finish_game
