# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'category_seed.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Category.new
#   t.string = row['action']
#   # t.string "ProductName", :limit => 55
#   # t.string "SaleTemplateName", :limit => 55
#   t.category = row['category']

#   t.save
#   puts "Category #{t.category_name} added"
# end


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
