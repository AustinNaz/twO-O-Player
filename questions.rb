require './questions_array'

class Questions
  def initialize questions_arr
    @questions_left = [*questions_arr]
  end
  
  def random_question
    random_question = @questions_left.sample
    @questions_left - [random_question]
    return random_question
  end
end