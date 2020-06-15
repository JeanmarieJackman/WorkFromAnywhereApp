class AddDescriptionToJoblisting < ActiveRecord::Migration[6.0]
  def change
    add_column :job_listings,:description,:string
  end
end
