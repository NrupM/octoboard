class Goal < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults, unless: :persisted?


  validates_length_of :daily_goal, :maximum => 34
  validates_length_of :weekly_goal, :maximum => 34
  validates_length_of :longterm_goal, :maximum => 34

  def set_defaults
    self.applications_per_day ||= 1
  end

end
