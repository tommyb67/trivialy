class QuestionsController < ApplicationController

  # once the game size is defined I need to iterate through that many questions

  def show
    @question = Question.find(params[:id])
  end

  # if the answer equals the correct answer set score to 10, if incorrect = 0
  def score
  end

end


