class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  def user_name
    user.name
  end
end
