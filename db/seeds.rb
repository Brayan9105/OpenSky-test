# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
country = ['Colombia', 'Venezuela', 'Argentina', 'Brazil', 'Chile', 'Ecuador', 'Bolivia']
country.each do |country|
  Country.create(name: country)
end

Author.create(
  [
    {name: 'Sara', age: 33, country_id: 1},
    {name: 'Armando', age: 28, country_id: 2},
    {name: 'Felicia', age: 42, country_id: 3},
    {name: 'Karen', age: 30, country_id: 4}
  ]
)