class HiringManager < ApplicationRecord
  has_many :job_listings
  has_many :job_applications, through: :job_listings


end
