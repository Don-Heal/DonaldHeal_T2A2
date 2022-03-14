class CreateBoughts < ActiveRecord::Migration[6.1]
  def change
    create_table :boughts do |t|

      t.string :name
      t.string :condition
      t.text :description
      t.integer :price
      t.boolean :sold, default: true
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
