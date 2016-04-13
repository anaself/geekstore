class CreateProductBasketJoinTable < ActiveRecord::Migration
  def self.up
    create_table :baskets_products do |t|
      t.integer :basket_id
      t.integer :product_id
    end

    add_index :baskets_products, [:basket_id, :product_id]
  end

  def self.down
    drop_table :baskets_products
  end
end
