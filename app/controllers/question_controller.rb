class QuestionController < ApplicationController
  # before_action :parmas_to_json, only: [:result]

  require 'byebug'

  def main
    @questions = Question.order("RANDOM()").limit(10)
  end

  def result
    # debugger
    # @result = Question.find_by(id: result_params[:id], answer: result_params[:answer])
    # @result = Question.find_by(id: result_params[:id], answer: result_params[:answer])
    # debugger
    target = params.require(:answer).permit!
    target_keys = target.to_h.keys
    # debugger
    target_values = target.to_h.values
    @success_count = 0
    @failed_questions = []
    @correct_answers = []
    # debugger
    Question.where(id: target_keys).each do |q|
      target_values.each_with_index do |v, i|
        if q.answer == v
          @success_count += 1
          # debugger
          # @success_count = 1
        elsif i == 1 && q.answer != v
          # @success_count = 2
          # debugger
          @failed_questions << q.question
          @correct_answers << q.answer
        end

        # if @questions.blank?
        #   # @questions = "不正解です"
        #   @success_count = 0
        # end
        # debugger
      end
      # debugger
    end
    # debugger
    render text: @success_count, plane: @failed_questions
    # render text: @failed_questions, plane: @success_count
    # debugger
  end

  private

  # def parmas_to_json
  #   target_keys1 = params.require(:answer).permit!
  #   target_keys2 = target_keys1.to_h.keys
  #   # params.require(:answer).to_h
  # end

  # def result_params
  #   # debugger
  #   params.permit(:answer, :id)
  # end
end

# target_keys = {"42"=>"abc", "23"=>"ddd", "8"=>"fff"}.keys
#  # => [42, 23, 8]
# target_values = {"42"=>"abc", "23"=>"ddd", "8"=>"fff"}.values
# @success_count = 0
# @questions = []
# Question.where(id: target_keys).each do |q|
#   target_values.each do |v|
#     if q.answer == v
#       @success_count += 1
#     else
#       @questions << @間違えたQuestionを保存
#   end
# end
# render success_count, 間違えたQuestion

