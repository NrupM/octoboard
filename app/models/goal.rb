class Goal < ApplicationRecord
  belongs_to :user

  validates_length_of :daily_goal, :maximum => 34
  validates_length_of :weekly_goal, :maximum => 34
  validates_length_of :longterm_goal, :maximum => 34

end
