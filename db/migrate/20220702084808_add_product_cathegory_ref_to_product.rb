class AddProductCathegoryRefToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :product_cathegory, type: :uuid, 
  end
end
