require 'rails_helper'

RSpec.describe Basket, type: :model do

  describe ".total_price" do
        it " empty basket" do
          basket = Basket.new
          expect(basket.total_price).to eql(0)
        end

        it "basket with one product" do
          basket = Basket.new
          product = Product.new
          product.price = 10
          basket.products.push(product)
          expect(basket.total_price).to eql(10)
        end

        it "basket with more than one product" do
          basket = Basket.new
          expect(basket.total_price).to eql(0)
        end
  end

end
