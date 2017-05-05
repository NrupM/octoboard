class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy


  enum application_method: [:company_site, :indeed, :linkedin, :monster, :craigslist, :in_person, :other]
  enum stage: [:pending_response, :interviewing, :declined]

end
