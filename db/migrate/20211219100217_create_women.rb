# frozen_string_literal: true

class CreateWomen < ActiveRecord::Migration[5.2]
  def change
    create_table :women do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :favourite_jacket

      t.timestamps
    end
  end
end
