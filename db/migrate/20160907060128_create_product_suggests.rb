class CreateProductSuggests < ActiveRecord::Migration
  def change
    create_table :product_suggests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :product_name
      t.text :description
      t.string :image
      t.integer :status

      t.timestamps null: false
    end
  end
end
