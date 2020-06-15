class JobSeeker < ApplicationRecord
  has_many :job_applications
  has_many :job_listings, through: :job_applications
end
