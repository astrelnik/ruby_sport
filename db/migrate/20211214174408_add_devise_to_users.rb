# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
