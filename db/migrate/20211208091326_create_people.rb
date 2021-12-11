class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
