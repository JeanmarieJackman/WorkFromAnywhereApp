class JobListing < ApplicationRecord
  belongs_to :hiring_manager
  has_many :job_applications
end
