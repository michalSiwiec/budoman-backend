class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions, id: :uuid do |t|
      t.text :content
      t.integer :mark
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
