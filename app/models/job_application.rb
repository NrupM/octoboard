class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy

  def self.search_job_apps(search)
    where("company_name ILIKE ? OR job_title ILIKE ? OR tech_stack ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  enum application_method: [:company_site, :indeed, :linkedin, :monster, :craigslist, :in_person, :other]
  enum stage: [:pending_response, :interviewing, :declined]

end
