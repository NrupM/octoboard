class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy


  enum application_methods: [:company_site, :indeed, :linkedIn, :monster, :craigslist, :in_person, :other]
  enum application_stages: [:pending_response, :interviewing, :declined]

end
