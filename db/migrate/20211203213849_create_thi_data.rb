# frozen_string_literal: true

class CreateThiData < ActiveRecord::Migration[6.1]
  def change
    create_table :thi_data do |t|
      t.belongs_to :site
      t.integer :thi
      t.datetime :date

      t.timestamps
    end
  end
end
