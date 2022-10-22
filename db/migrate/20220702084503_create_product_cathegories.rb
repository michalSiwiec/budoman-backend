# frozen_string_literal: true

class CreateProductCathegories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_cathegories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
