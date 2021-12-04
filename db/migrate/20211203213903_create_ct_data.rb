# frozen_string_literal: true

class CreateCtData < ActiveRecord::Migration[6.1]
  def change
    create_table :ct_data do |t|
      t.belongs_to :site
      t.integer :ct
      t.datetime :date

      t.timestamps
    end
  end
end
