# frozen_string_literal: true

class SiteAdvisor < ApplicationRecord
  belongs_to :advisor, class_name: 'User'
  belongs_to :advised_site, class_name: 'Site'
end
