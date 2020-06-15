class CreateHiringManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :hiring_managers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :company
      t.string :phone
      t.string :address
      t.string :fax

      t.timestamps
    end
  end
end
