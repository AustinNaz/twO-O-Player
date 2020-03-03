require './players'
require './questions'
require './answers'

class GameLoop

  def initialize player1, player2, questions_arr, lives
    @@max_lives = lives
    @@player1 = Players.new player1, @@max_lives
    @@player2 = Players.new player2, @@max_lives
    @@questions = Questions.new questions_arr
    @@answers = Answers.new

    @@has_game_ended = false
    @@whos_turn_is_it = @@player1
    @@current_question = {}
    @@turn = 1
    
    game_loop
  end

  def remove_life player
    if player.name == @@player1.name
      @@player1.lives -= 1
    else
      @@player2.lives -= 1
    end
  end

  private

  def game_loop
    while !@@has_game_ended
      @@current_question = @@questions.random_question
      puts "#{@@whos_turn_is_it.name}: #{@@current_question[:question]}?"
      answer = gets.chomp
      if @@current_question[:answer] == answer.to_i
        result = @@answers.give_answer? true
        puts "#{@@whos_turn_is_it.name}: #{result}"
      else
        result = @@answers.give_answer? false
        puts "#{@@whos_turn_is_it.name}: #{result}"
        remove_life @@whos_turn_is_it
      end

      puts "#{@@player1.name}: #{@@player1.lives.to_s}/#{@@max_lives} vs #{@@player2.name}: #{@@player2.lives.to_s}/#{@@max_lives}"

      if @@whos_turn_is_it == @@player1
        @@whos_turn_is_it = @@player2
      else
        @@whos_turn_is_it = @@player1 
      end

      if @@player1.is_still_alive? && @@player2.is_still_alive?
        puts "---- #{@@whos_turn_is_it.name}'s Turn ----"
      else
        winner = @@player1.is_still_alive? ? @@player1 : @@player2
        puts "#{winner.name} wins with a score of #{winner.lives}/#{@@max_lives}"
        puts '---- Game Over ----'
        puts 'Good Bye!'
        @@has_game_ended = true
      end
    end
  end  
end  