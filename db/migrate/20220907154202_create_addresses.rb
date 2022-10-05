# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.datetime :create_at, null: false, default: 'now'
      t.datetime :updated_at, null: false, default: 'now'
      t.timestamps null: false
    end
  end
end
