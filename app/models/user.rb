class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :job_applications, dependent: :destroy
  has_many :interviews, dependent: :destroy
  after_initialize :set_defaults, unless: :persisted?


  def set_defaults
    self.octopower  ||= 10
    self.image  ||= 'https://d28rk61hailme.cloudfront.net/assets/default_user-856f2487c07862f3089cfcb1528df354.png'
    self.job_applications.count ||= 0
    self.interviews.count ||= 0
  end


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  enum job_status: [:seeking, :employed]
end
