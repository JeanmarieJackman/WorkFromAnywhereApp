class AddWebsiteUrlToHiringManager < ActiveRecord::Migration[6.0]
  def change
    add_column :hiring_managers,:website_url,:string
  end
end
