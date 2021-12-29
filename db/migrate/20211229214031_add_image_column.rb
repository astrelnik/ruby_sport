class AddImageColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :articles do |a|
      a.column :image, :string
    end
  end
end
