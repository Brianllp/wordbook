class QuestionController < ApplicationController
  require 'byebug'

  def main
    # debugger
    @questions = Question.all.order("created_at ASC")
    # logger.debug @questions.to_yaml

    # @questions = Question.all(params[:question])
    # @questions = Question.find(random.rand(50))
    # @questions = Question.offset( rand(Question.count) ).first
  end

  def result
    debugger
    @result = Question.find_by(answer: result_params[:answer])
    # @result = Question.find_by(answer: params[:answer])
    debugger
    if @result
      redirect_to question_result_path, notice: "回答しました"
    end
  end

  private

  def result_params
    params.require(:question).permit(:answer)
  end
end
