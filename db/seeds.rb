# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'email@example.com', password: '12345678', password_confirmation: '12345678', name: 'username')
#
# Rut.create(rut: '1')
# Rut.create(rut: '2')
# Rut.create(rut: '3')
# Rut.create(rut: '4')
# Rut.create(rut: '5')
# Rut.create(rut: '6')
# Rut.create(rut: '7')
# Rut.create(rut: '8')
# Rut.create(rut: '9')
# Rut.create(rut: '10')
# Rut.create(rut: '11')
# Rut.create(rut: '12')
# Rut.create(rut: '100')

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'input_file.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
imported = 0
errors = 0
csv.each do |row|
  t = Rut.new
  begin
    t.rut = row['rut']+row['DV'].upcase
    t.save
  rescue
    p 'exception on seed import'
    errors = errors + 1
  end
  # p imported
  imported = imported + 1
end

puts "There are now #{Rut.count} rows in the ruts table"
puts "Found #{errors} errors during import"
