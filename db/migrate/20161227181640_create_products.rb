class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      # ebay specific columns
      t.string "action", :default => "Add"
      # t.string "ProductName", :limit => 55
      # t.string "SaleTemplateName", :limit => 55
      t.integer "category", :limit => 3
      t.string "title", :limit => 80
      t.text "description", :limit => 500000
      t.text "conditionDescription"
      t.integer "conditionID", :limit => 4
      t.string "picURL", :limit => 2048
      t.integer "quantity", :limit => 1, :default => 1
      t.string "brand"
      t.string "manufacturerPartNumber"
      t.string "format", :default => "FixedPrice"
      t.decimal "startPrice", :limit => 8
      t.decimal "buyItNowPrice", :limit => 8
      t.integer "duration", :limit => 1, :default => 30
      t.boolean "immediatePayRequired", :default => true
      t.integer "postalCode", :limit => 3
      t.string "location", :limit => 45
      t.string "galleryType", :default => "Gallery"
      t.boolean "payPalAccepted", :default => true
      t.string "payPalEmailAddress", :default => "redlinemotorcycles@yahoo.com"
      t.text "paymentInstructions", :limit => 500
      t.integer "storeCategory", :limit => 1
      t.integer "shippingDiscountProfileID"
      t.string "domesticRateTable"
      t.string "shippingType", :default => "Flat"
      # Shipping option 1
      t.string "shippingService-1:Option", :default => "UPSGround"
      t.decimal "shippingService-1:Cost", :limit => 8
      t.boolean "shippingService-1:FreeShipping", :default => true
      t.integer "shippingService-1:Priority", :default => 1, :limit => 1
      t.decimal "shippingService-1:ShippingSurcharge", :limit => 8
      # Shipping option 2
      t.string "shippingService-2:Option"
      t.decimal "shippingService-2:Cost", :limit => 8
      t.boolean "shippingService-2:FreeShipping", :default => true
      t.integer "shippingService-2:Priority", :default => 1, :limit => 1
      t.decimal "shippingService-2:ShippingSurcharge", :limit => 8
      t.integer "dispatchTimeMax", :default => 4, :limit => 1
      t.string "returnsAcceptedOption", :default => "ReturnsNotAccepted"
      t.string "refundOption"
      t.string "returnsWithinOption"
      t.string "shippingCostPaidByOption"
      t.string "additionalDetails", :limit => 5000, :default => "Returns not accepted unless the fault falls on us (Redline Motorcycles). Please contact us via eBay to reconcile a dispute, and we will do our best to correct our mistake. Returns will not be accepted for buyer negligence or remorse"
      # enter profiles
      t.string "shippingProfileName", :limit => 50
      t.string "refundProfileName", :limit => 50
      t.string "paymentProfileName", :limit => 50
      t.boolean "useTaxTable", :default => true
      t.timestamps
    end
  end
end
