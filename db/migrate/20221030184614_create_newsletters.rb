# frozen_string_literal: true

class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters, id: :uuid do |t|
      t.string :email
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
