class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories do |t|
      t.integer :category_id
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
