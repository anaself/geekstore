# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Basket < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user

  def total_price
    products = Product.in_basket(self)
    total_price = 0
    products.each do |product|
      product_in_basket = BasketsProduct.find_by(basket_id: self.id, product_id: product.id)
      total_price += product_in_basket.quantity * Product.find(product_in_basket.product_id).price
    end
    total_price
  end

  def products_quantities
    products_in_baskets = BasketsProduct.where(basket_id: self.id)
    quantities = Hash.new

    products_in_baskets.each do |product|
      quantities[product.product_id] = product.quantity
    end
    quantities
  end

  def put(product_id, quantity)
    basket_product = BasketsProduct.find_by(product_id: product_id, basket_id: self.id)

    if(basket_product.nil?)
      self.products.push(Product.find(product_id))
      self.save
      basket_product = BasketsProduct.find_by(product_id: product_id, basket_id: self.id)
      basket_product.quantity  = quantity
      basket_product.save
    else
      basket_product.quantity += quantity.to_i
      basket_product.save
    end
  end
end
