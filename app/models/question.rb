class Question < ActiveRecord::Base
  has_and_belongs_to_many :games

  def correct_answer?(user_answer)
    answer.downcase == user_answer.downcase
  end
end