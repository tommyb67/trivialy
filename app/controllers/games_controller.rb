class GamesController < ApplicationController

  # def new
  # end

  def create
    @game = Game.new(score: 0)
    @game.save!

    @user = User.find( params[:user_id] )
    @user.games << @game

    @game.reload

    #binding.pry

    redirect_to user_game_path( @user, @game )
  end

  def show
    @game = Game.find(params[:id])

    # a game is 5 questions long
    if @game.questions.count <= 5

      # We are grabbing 5 random questions from the db
      ids = Question.pluck(:id)
      @question = Question.find(ids.sample)

      # ensure that this question isn't a repeat
      while @game.questions.include? @question
        @question = Question.find(ids.sample)
      end

      ## check that the answer is correct and increment the score
      score = 0
      if @your_answer_is == @question.answer
          @score = score + 10
        else
          @score = score
      end

      # I think I need a reload in here to update the score!!!


      # push these questions into this instance of game
      @game.questions << @question

      # push the score of the game into the instance of this game
      @game.score << @score


      #binding.pry

      render :show
    else
      render text: "GAME OVER"
      #render :over
    end
  end

  private

  def get_question( game_instance )

  end

end