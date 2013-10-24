class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :games

  def history
    u = User.game(params[user_id]).score.desc
  end

end