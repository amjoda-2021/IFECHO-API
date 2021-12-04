# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

[CtDatum, SiteAdvisor, Site, ThiDatum, User].map(&:destroy_all)

%w[ct_data site_advisors sites thi_data users].map do |tab|
  ActiveRecord::Base.connection.reset_pk_sequence!(tab)
end

User.create(first_name: 'jo', last_name: 'justman',
            email: 'jojo.justman@gmail.com', password: '123456', is_advisor?: true)

bdd_meteo = CSV.read('app/assets/mailleLONLATALT.csv',
                     headers: true, liberal_parsing: true)

bdd_farms = CSV.read('app/assets/fermes_exp.csv',
                     headers: true, liberal_parsing: true)

bdd_thi = CSV.read('app/assets/fake_data.csv',
                   headers: true, liberal_parsing: true)

bdd_meteo.each_with_index do |row, _i|
  row2 = row[0].split(';')
  Site.create(latitude: (row2[1].to_f * 10_000).to_i,
              longitude: (row2[2].to_f * 10_000).to_i, site_type: 'meteo')
end

bdd_farms.each do |row|
  row2 = row[0].split(';')
  Site.create(name: row2[0], longitude: (row2[1].to_f * 10_000).to_i,
              latitude: (row2[2].to_f * 10_000).to_i, site_type: 'production')
end

bdd_thi.each do |row|
  row2 = row[0].split(';')
  ThiDatum.create(site:   )
end

# THI : de 33 à 90, pas de temps : heure
