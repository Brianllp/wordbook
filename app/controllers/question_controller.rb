class QuestionController < ApplicationController
  def main
    @questions = Question.order("RANDOM()").limit(10)
  end

  def result
    target = params.require(:answer).permit!
    target_keys = target.to_h.keys
    target_values = target.to_h.values
    @success_count = 0
    @failed_questions = []
    @correct_answers = []

    Question.where(id: target_keys).each do |q|
      target_values.each_with_index do |v, i|
        if q.answer == v
          @success_count += 1
        elsif i == 1 && q.answer != v
          @failed_questions << q.question
          @correct_answers << q.answer
        end
      end
    end
    render text: @success_count, plane: @failed_questions
  end
end