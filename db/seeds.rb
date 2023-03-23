# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'

#Parse json file, pulled out data and recorded in the database
file = File.read('db/data.json')
data = JSON.parse(file)

data.each do |item|
  product = Payload.new
  product.name = item['Name']
  product.ptype = item['Type']
  product.designed_by = item['Designed by']
  product.save
end
