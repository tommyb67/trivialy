class Game < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :questions

  def next_question
    if questions.none?
      return Question.order("RANDOM()").first
    elsif questions.count <= 4
      Question.where("id not in (?)", self.questions.pluck(:id)).order("RANDOM()").first
    else
      false
    end
  end
end