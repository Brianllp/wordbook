class QuestionController < ApplicationController
  require 'byebug'

  def main
    # debugger
    # @questions = Question.all.order("created_at ASC")
    @questions = Question.order("RANDOM()").limit(3)
    # logger.debug @questions.to_yaml
  end

  def result
    # debugger
    @result = Question.find_by(id: result_params[:id],answer: result_params[:answer])
    # @result = Question.find_by(answer: params[:answer])
    # debugger
    if @result
      redirect_to question_result_path, notice: "回答しました"
    end
  end

  private

  def result_params
    debugger
    params.permit(:answer, :id)
  end
end
