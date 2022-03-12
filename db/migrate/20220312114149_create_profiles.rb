class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
