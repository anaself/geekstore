namespace :db do
 desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    require 'factory_girl_rails'

    User.populate 10 do |user|
      user.first_name = Faker::Name.name
      user.last_name = Faker::Company.name
      user.email = Faker::Internet.email
      user.phone = Faker::PhoneNumber.phone_number
      user.encrypted_password = User.new(:password => "123456789").encrypted_password
      user.sign_in_count = 1

      Basket.populate 1 do |basket|
        basket.user_id = user.id
      end

      r = Random.new
      number_of_devices = r.rand(1...20)

      Device.populate number_of_devices do |device|
        device.model = Faker::Commerce.product_name
        device.user_id = user.id
        device.mac_adress = Faker::Internet.mac_address
      end

      Authentification.populate 10 do |authentification|
        authentification.user_id = user.id
        data = {
          :country => Faker::Address.country,
          :country_code => Faker::Address.country_code,
          :latitude => Faker::Address.latitude,
          :longitude => Faker::Address.longitude
        }
        authentification.local = data.to_json
      end
    end

    Category.populate 5 do |category|
      category.name = Populator.words(1..3).titleize
    end

    Product.populate 20 do |product|
      product.name = Faker::Commerce.product_name
      product.price = Faker::Commerce.price
      product.color = Faker::Commerce.color
      product.quantity = Faker::Number.number(3)
    end

    categories = Category.all
    products = Product.all

    products.each do |product|
      list_categories = categories
      index_table = []
      i = 0
      5.times do
        index_table.push(i)
        i += 1
      end
      count = Random.rand(1..5)
      j = 4
      j.to_i
      count.times do
        a = Random.rand(0..j)
        product.categories.push(list_categories[ index_table[a] ])
        b = index_table[a]
        index_table[a] = index_table[j]
        index_table[j] = a
        j -= 1
      end
    end
  end
end
