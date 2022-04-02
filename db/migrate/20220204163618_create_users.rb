# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :password
      t.hstore :avatars, array: true

      t.timestamps
    end
  end
end
