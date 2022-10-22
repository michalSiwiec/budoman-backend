# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.float :price
      t.integer :available_quantity
      t.string :picture

      t.timestamps
    end
  end
end
