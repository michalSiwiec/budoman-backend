# frozen_string_literal: true

class CreateProductsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :products_orders, id: :uuid do |t|
      t.references :order, index: true, foreign_key: true, type: :uuid
      t.references :product, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
