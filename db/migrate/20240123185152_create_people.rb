# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
