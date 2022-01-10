class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories do |t|
      t.belongs_to :category
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
