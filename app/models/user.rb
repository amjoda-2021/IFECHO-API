# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sites, foreign_key: 'breeder_id', dependent: :destroy, inverse_of: 'breeder'
  has_many :site_advisors, foreign_key: 'advisor_id', dependent: :destroy, inverse_of: 'advisor'
  has_many :advised_sites, through: :site_advisors, class_name: 'Site'

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end
