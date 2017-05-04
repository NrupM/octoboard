class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy
end
