class AddColumnQuantityProductsBaskets < ActiveRecord::Migration
  def change
    add_column :baskets_products, :quantity, :integer
  end
end
