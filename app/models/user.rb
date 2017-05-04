class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :job_applications, dependent: :destroy


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
