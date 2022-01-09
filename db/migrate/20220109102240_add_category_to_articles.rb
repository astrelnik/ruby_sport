class AddCategoryToArticles < ActiveRecord::Migration[7.0]
  def change
    change_table :articles do |a|
      a.column :category_id, :int, null: true
    end
  end
end
