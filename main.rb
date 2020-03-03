require 'pry'
require './game_loop'
require './questions_array'
# require './questions'
# require './answers'
# require './players'

# player = Players.new 'test1', 3
# answer = Answers.new
# questions = Questions.new @questions_arr
GameLoop. new 'test1', 'test2', @questions_arr, 3
binding.pry

pp @questions_arr
