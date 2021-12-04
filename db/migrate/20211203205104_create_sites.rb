# frozen_string_literal: true

class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :site_type
      t.belongs_to :breeder, foreign_key: { to_table: :users }, index: true
      t.string :location
      t.string :city
      t.string :post_code
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
