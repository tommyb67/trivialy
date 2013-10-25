class GamesController < ApplicationController

  before_action :current_user, only: [:edit]
  # def new
  # end

  def create
    @game = Game.new(score: 0)
    @game.save!

    @user = User.find( params[:user_id] )
    @user.games << @game

    @game.reload

    #binding.pry

    redirect_to edit_user_game_path( @user, @game )
  end

  def update
    answered_question = Question.find(params[:question_id])
    @game = Game.find(params[:id])
    @game.questions << answered_question

    if answered_question.correct_answer?(params[:your_answer_is])
      # Increment the score
      s = rand(5..50)
      @game.score += s
    end

    # Move on to the next question

    @game.save

    if @question = @game.next_question
      render :edit
    else
      #binding.pry
      render :over
    end

  end

  def edit
    @game = Game.find(params[:id])
    @question = @game.next_question
  end

  # def show

  # end

end