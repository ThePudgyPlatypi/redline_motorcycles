class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.integer "category_id"
      t.string "subcategory_name"
      t.text "subcategory_description"
      t.string "subcategory_picture"
      # #Motorcycles sub categories
      # t.boolean "motorcycle_engine", :default => false
      # t.boolean "motorcycle_electrical", :default => false
      # t.boolean "motorcycle_acc", :default => false
      # t.boolean "motorcycle_wheels", :default => false
      # t.boolean "motorcycle_brakes", :default => false
      # t.boolean "motorcycle_body", :default => false
      # t.boolean "motorcycle_suspension", :default => false
      # t.boolean "motorcycle_forsale", :default => false
      #
      # #ATV/UTV subcats
      # t.boolean "atvutv_engine", :default => false
      # t.boolean "atvutv_electrical", :default => false
      # t.boolean "atvutv_acc", :default => false
      # t.boolean "atvutv_wheels", :default => false
      # t.boolean "atvutv_brakes", :default => false
      # t.boolean "atvutv_body", :default => false
      # t.boolean "atvutv_suspension", :default => false
      # t.boolean "atvutv_forsale", :default => false
      #
      # #Kymco subcats
      # t.boolean "kymco_atv", :default => false
      # t.boolean "kymco_atv_acc", :default => false
      # t.boolean "kymco_utv", :default => false
      # t.boolean "kymco_utv_acc", :default => false
      # t.boolean "kymco_scooter", :default => false
      # t.boolean "kymco_scooter_acc", :default => false
      t.timestamps
    end
    add_index('subcategories', ['category_id'])
  end
end
