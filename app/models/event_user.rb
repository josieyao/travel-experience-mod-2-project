class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def correct_user?(params)
    if self.user_id == params.to_i
      return true
    end
  end

end
