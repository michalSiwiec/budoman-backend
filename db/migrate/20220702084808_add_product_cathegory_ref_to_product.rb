class AddProductCathegoryRefToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :product_cathegory, foreign_key: true, type: :uuid
  end
end
