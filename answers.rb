class Answers
  def initialize
    @answers_arr = ['correct', 'wrong', 'you won']
  end
  
  def give_answer? answer_result
    if answer_result
      @answers_arr[0]
    else 
      @answers_arr[1]
    end
  end
end