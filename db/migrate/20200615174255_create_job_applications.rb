class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.integer :job_listing_id
      t.integer :job_seeker_id

      t.timestamps
    end
  end
end
