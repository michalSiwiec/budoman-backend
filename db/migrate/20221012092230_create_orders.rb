class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :name
      t.string :surname
      t.string :phone_number
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :delivery_method
      t.string :payment_method
      t.references :user, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
