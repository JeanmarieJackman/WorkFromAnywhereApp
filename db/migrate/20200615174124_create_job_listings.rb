class CreateJobListings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.datetime :start_date
      t.integer :hiring_manager_id
      t.boolean :job_filled_status, default: false

      t.timestamps
    end
  end
end
