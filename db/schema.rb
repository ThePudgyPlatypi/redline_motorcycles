# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170104162634) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_name"
    t.text     "category_description", limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "action",                                                    default: "Add"
    t.integer  "category",                  limit: 3
    t.string   "title",                     limit: 80
    t.text     "description",               limit: 16777215
    t.text     "conditionDescription",      limit: 65535
    t.integer  "conditionID"
    t.string   "picURL",                    limit: 2048
    t.integer  "quantity",                  limit: 1,                       default: 1
    t.string   "brand"
    t.string   "manufacturerPartNumber"
    t.string   "listingformat",                                             default: "FixedPrice"
    t.decimal  "startPrice",                                 precision: 10
    t.decimal  "buyItNowPrice",                              precision: 10
    t.integer  "duration",                  limit: 1,                       default: 30
    t.boolean  "immediatePayRequired",                                      default: true
    t.integer  "postalCode",                limit: 3
    t.string   "location",                  limit: 45
    t.string   "galleryType",                                               default: "Gallery"
    t.boolean  "payPalAccepted",                                            default: true
    t.string   "payPalEmailAddress",                                        default: "redlinemotorcycles@yahoo.com"
    t.text     "paymentInstructions",       limit: 65535
    t.integer  "storeCategory",             limit: 1
    t.integer  "shippingDiscountProfileID"
    t.string   "domesticRateTable"
    t.string   "shippingType",                                              default: "Flat"
    t.string   "shippingOption",                                            default: "UPSGround"
    t.decimal  "shippingCost",                               precision: 10
    t.boolean  "shippingFreeShipping",                                      default: true
    t.integer  "shippingPriority",          limit: 1,                       default: 1
    t.decimal  "shippingShippingSurcharge",                  precision: 10
    t.integer  "dispatchTimeMax",           limit: 1,                       default: 4
    t.string   "returnsAcceptedOption",                                     default: "ReturnsNotAccepted"
    t.string   "refundOption"
    t.string   "returnsWithinOption"
    t.string   "shippingCostPaidByOption"
    t.string   "additionalDetails",         limit: 5000,                    default: "Returns not accepted unless the fault falls on us (Redline Motorcycles). Please contact us via eBay to reconcile a dispute, and we will do our best to correct our mistake. Returns will not be accepted for buyer negligence or remorse"
    t.string   "shippingProfileName",       limit: 50
    t.string   "refundProfileName",         limit: 50
    t.string   "paymentProfileName",        limit: 50
    t.boolean  "useTaxTable",                                               default: true
    t.datetime "created_at",                                                                                                                                                                                                                                                                                                     null: false
    t.datetime "updated_at",                                                                                                                                                                                                                                                                                                     null: false
    t.integer  "subcategory_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree
  end

  create_table "subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.string   "subcategory_name"
    t.text     "subcategory_description", limit: 65535
    t.string   "subcategory_picture"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

end
