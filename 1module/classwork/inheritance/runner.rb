require './ceo'
require './salesmanager'

ali = Ceo.new(15, 20, "Ali", 1)
sam = SalesManager.new(10, 100)

puts ali.total_compensation
puts ali.benefits
puts sam.total_compensation
puts sam.benefits

