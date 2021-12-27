class ChangeDescColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :articles do |a|
      a.change :desc, :text
    end
  end
end
