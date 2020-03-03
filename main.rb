require './game_loop'
require './questions_array'

def play
  puts "Enter first players name:"
  player1 = gets.chomp
  puts "Enter second players name:"
  player2 = gets.chomp
  puts "Enter amount of lives to start with:"
  lives = gets.chomp.to_i
  while lives == 0
    puts "Please enter a valid number of lives"
    lives = gets.chomp.to_i
  end
  puts "Have Fun!"

  GameLoop.new player1, player2, @questions_arr, lives
end

play