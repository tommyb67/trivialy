class Game < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :questions

  def next_question

    if questions.count <= 5
      ids = Question.pluck(:id)
      question = Question.find(ids.sample)


      # ensure that this question isn't a repeat
      while self.questions.include? question
        question = Question.find(ids.sample)
      end


      self.questions << question

      return question
    else
      return false
    end

  end
end