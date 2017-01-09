# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'test_seed.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Product.new
#   # ebay specific columns
#   t.action = row['action']
#   # t.string "ProductName", :limit => 55
#   # t.string "SaleTemplateName", :limit => 55
#   t.category = row['category']
#   t.title = row['title']
#   t.description = row['description']
#   t.conditionDescription = row['conditionDescription']
#   t.conditionID = row['conditionID']
#   t.picURL = row['picURL']
#   t.quantity = row['quantity']
#   t.brand = row['c:Brand']
#   t.manufacturerPartNumber = row['c:Manufacturer Part Number']
#   t.listingformat = row['format']
#   t.startPrice = row['startPrice']
#   t.buyItNowPrice = row['buyItNowPrice']
#   t.duration = row['duration']
#   t.immediatePayRequired = row['immediatePayRequired']
#   t.postalCode = row['postalCode']
#   t.location = row['location']
#   t.galleryType = row['galleryType']
#   t.payPalAccepted = row['payPalAccepted']
#   t.payPalEmailAddress = row['payPalEmailAddress']
#   t.paymentInstructions = row['paymentInstructions']
#   t.storeCategory = row['storeCategory']
#   t.shippingDiscountProfileID = row['shippingDiscountProfileID']
#   t.domesticRateTable = row['domesticRateTable']
#   t.shippingType = row['shippingType']
#   # Shipping option 1
#   t.shippingOption = row['shippingService-1:Option']
#   t.shippingCost = row['shippingService-1:Cost']
#   t.shippingFreeShipping = row['shippingService-1:FreeShipping']
#   t.shippingPriority = row['shippingService-1:Priority']
#   t.shippingShippingSurcharge = row['shippingService-1:ShippingSurcharge']
#   t.dispatchTimeMax = row['dispatchTimeMax']
#   t.returnsAcceptedOption = row['returnsAcceptedOption']
#   t.refundOption = row['refundOption']
#   t.returnsWithinOption = row['returnsWithinOption']
#   t.shippingCostPaidByOption = row['shippingCostPaidByOption']
#   t.additionalDetails = row['additionalDetails']
#   t.shippingProfileName = row['shippingProfileName']
#   t.refundProfileName = row['refundProfileName']
#   t.paymentProfileName = row['paymentProfileName']
#   t.useTaxTable = row['useTaxTable']
#   t.save
#   puts "Product #{t.title} #{t.id} added with #{t.picURL}"
# end
