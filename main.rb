require './players'
require './game'

#enter player 1
puts "player 1: please enter your name"
input_name1 = gets.chomp
player1 = Players.new(input_name1, 1)

#enter player 2
puts "player 2: please enter your name"
input_name2 = gets.chomp
player2 = Players.new(input_name2, 2)

#start and end game
game = Game.new(player1, player2)