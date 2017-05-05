class Interview < ApplicationRecord
  belongs_to :job_application
  belongs_to :user
end
