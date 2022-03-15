class CreateItems < ActiveRecord::Migration[6.1]

  def change
    create_table :items do |t|
      t.string :name
      t.integer :condition
      t.text :description
      t.integer :price
      t.boolean :sold, default: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
