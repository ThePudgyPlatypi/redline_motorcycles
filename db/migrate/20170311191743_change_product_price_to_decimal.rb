class ChangeProductPriceToDecimal < ActiveRecord::Migration[5.0]
  def up
    change_column('products', 'startPrice', :decimal, :precision => 7, :scale => 2)
  end

  def down
    change_column('products', 'startPrice', :decimal)
  end
end
