class CreateMen < ActiveRecord::Migration[5.2]
  def change
    create_table :men do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :favourite_car

      t.timestamps
    end
  end
end
