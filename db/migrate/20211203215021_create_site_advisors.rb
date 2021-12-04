# frozen_string_literal: true

class CreateSiteAdvisors < ActiveRecord::Migration[6.1]
  def change
    create_table :site_advisors do |t|
      t.belongs_to :advised_site, foreign_key: { to_table: :sites }, index: true
      t.belongs_to :advisor, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
