class Interview < ApplicationRecord
  belongs_to :job_application
  belongs_to :user

  validates :is_followup_needed,
            :presence => { :if => 'is_followup_needed.nil?' }
  validates :is_challenge_completed,
            :presence => { :if => 'is_challenge_completed.nil?' }

  enum interview_types: [:phone, :online, :in_person]

end
