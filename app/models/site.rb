# frozen_string_literal: true

class Site < ApplicationRecord
  belongs_to :breeder, class_name: 'User', optional: true
  has_many :site_advisors, foreign_key: 'advised_site_id', dependent: :destroy, inverse_of: 'advised_site'
  has_many :advisors, through: :site_advisors, class_name: 'User'

  has_many :ct_data, dependent: :destroy
  has_many :thi_data, dependent: :destroy

  enum site_type: { production: 0, meteo: 1 }

  validates :site_type, presence: true
end
