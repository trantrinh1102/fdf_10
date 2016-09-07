class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :category, index: true, foreign_key: true
      t.float :rate_score
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
