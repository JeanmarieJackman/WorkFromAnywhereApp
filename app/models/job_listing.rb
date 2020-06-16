class JobListing < ApplicationRecord
  belongs_to :hiring_manager
  has_many :job_applications
  has_many :job_seekers, through: :job_applications
end
