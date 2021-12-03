# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

[CtDatum, SiteAdvisor, Site, ThiDatum, User].map do |model|
  model.destroy_all
end

%w[ct_data site_advisors sites thi_data users].map do |tab|
  ActiveRecord::Base.connection.reset_pk_sequence!(tab)
end

User.create(first_name:"jo", last_name:"justman", email:"jojo.justman@gmail.com", password:"123456", is_advisor?:true)

bdd = CSV.read('app/assets/mailleLONLATALT.csv',
               headers: true, liberal_parsing: true)

bdd.each do |row|
  row_2 = row[0].split(";")
  puts row_2[1]
end
