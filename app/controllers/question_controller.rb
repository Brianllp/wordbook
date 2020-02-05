class QuestionController < ApplicationController
  def main
    @questions = Question.all.order("created_at ASC")
    # @questions = Question.all(params[:question])
    # @questions = Question.find(random.rand(50))
    # @questions = Question.offset( rand(Question.count) ).first
  end
end
