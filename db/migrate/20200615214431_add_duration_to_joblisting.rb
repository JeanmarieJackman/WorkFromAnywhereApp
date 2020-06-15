class AddDurationToJoblisting < ActiveRecord::Migration[6.0]
  def change
    add_column :job_listings,:duration,:string
  end
end
