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

    @game = Game.find(params[:id])
    #binding.pry


    if Question.find(params[:question_id]).correct_answer?(params[:your_answer_is])
      # Increment the score
      @game.score += 10
    end

    # Move on to the next question

    @game.save

    if @question = @game.next_question
      render :edit
    else
      render :over
    end

  end

  def edit
    ids = Question.pluck(:id)
    @question = Question.find(ids.sample)

    @game = Game.find(params[:id])
  end

  # def show
  #   @game = Game.find(params[:id])
  # end

end