class CreateJobSeekers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_seekers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :address
      t.string :profile_picture
      t.string :phone
      t.string :resume_link
      t.string :website_link
      t.string :title_tagline

      t.timestamps
    end
  end
end
