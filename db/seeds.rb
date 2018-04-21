# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES_FILE = Rails.root.join('db', 'seed_data', 'categories.csv')
puts "Loading raw category data from #{CATEGORIES_FILE}"

category_failures = []
CSV.foreach(CATEGORIES_FILE, :headers => true) do |row|
  category = Category.new
  category.name = row['name']
  successful = category.save
  if !successful
    category_failures << category
    puts "Failed to save category: #{category.inspect}"
  else
    puts "Created category: #{category.inspect}"
  end
end

puts "Added #{Category.count} category records"
puts "#{category_failures.length} categories failed to save"



MERCHANTS_FILE = Rails.root.join('db', 'seed_data', 'merchants.csv')
puts "Loading raw merchant data from #{MERCHANTS_FILE}"

merchant_failures = []
CSV.foreach(MERCHANTS_FILE, :headers => true) do |row|
  merchant = Merchant.new
  merchant.username = row['username']
  merchant.email = row['email']
  successful = merchant.save
  if !successful
    merchant_failures << merchant
    puts "Failed to save merchant: #{merchant.inspect}"
  else
    puts "Created merchant: #{merchant.inspect}"
  end
end

puts "Added #{Merchant.count} merchant records"
puts "#{merchant_failures.length} merchants failed to save"



ORDERS_FILE = Rails.root.join('db', 'seed_data', 'orders.csv')
puts "Loading raw order data from #{ORDERS_FILE}"

order_failures = []
CSV.foreach(ORDERS_FILE, :headers => true) do |row|
  order = Category.new
  order.status = row['status']
  order.name = row['name']
  order.email = row['email']
  order.address = row['address']
  order.cc_num = row['cc_num']
  order.expiry_date = row['expiry_date']
  order.cc_cvv = row['cc_cvv']
  order.zip = row['zip']
  successful = order.save
  if !successful
    order_failures << order
    puts "Failed to save order: #{order.inspect}"
  else
    puts "Created order: #{order.inspect}"
  end
end

puts "Added #{Order.count} order records"
puts "#{order_failures.length} orders failed to save"



PRODUCTS_FILE = Rails.root.join('db', 'seed_data', 'products.csv')
puts "Loading raw category data from #{PRODUCTS_FILE}"

product_failures = []
CSV.foreach(PRODUCTS_FILE, :headers => true) do |row|
  product = Product.new
  product.name = row['name']
  product.price = row['price']
  product.available = row['available']
  product.merchant_id = Merchant.find_by(username: row['merchant_username']).id
  successful = product.save
  if !successful
    product_failures << product
    puts "Failed to save product: #{product.inspect}"
  else
    puts "Created product: #{product.inspect}"
  end
end

puts "Added #{Product.count} product records"
puts "#{product_failures.length} products failed to save"




REVIEWS_FILE = Rails.root.join('db', 'seed_data', 'reviews.csv')
puts "Loading raw review data from #{REVIEWS_FILE}"

review_failures = []
CSV.foreach(REVIEWS_FILE, :headers => true) do |row|
  review = Review.new
  review.rating = row['rating']
  review.description = row['description']
  review.product_id = Product.find_by(name: row['product_name']).id
  successful = review.save
  if !successful
    review_failures << review
    puts "Failed to save review: #{review.inspect}"
  else
    puts "Created review: #{review.inspect}"
  end
end

puts "Added #{Review.count} review records"
puts "#{review_failures.length} reviews failed to save"



CATEGORIESPRODUCTS_FILE = Rails.root.join('db', 'seed_data', 'categories-products.csv')
puts "Loading raw categories_products data from #{CATEGORIESPRODUCTS_FILE}"

categoryproduct_failures = []
CSV.foreach(CATEGORIESPRODUCTS_FILE_FILE, :headers => true) do |row|
  category_product = CategoryProduct.new
  category_product.category_id = Category.find_by(name: row['category_name']).id
  category_product.product_id = Product.find_by(name: row['product_name']).id
  successful = category_product.save
  if !successful
    categoryproduct_failures << category_product
    puts "Failed to save category_product: #{category_product.inspect}"
  else
    puts "Created category_product: #{category_product.inspect}"
  end
end

puts "Added #{CategoryProduct.count} category_product records"
puts "#{categoryproduct_failures.length} category_product records failed to save"



ORDERSPRODUCTS_FILE = Rails.root.join('db', 'seed_data', 'orders-products.csv')
puts "Loading raw orders_products data from #{ORDERSPRODUCTS_FILE}"

orderproduct_failures = []
CSV.foreach(CATEGORIESPRODUCTS_FILE_FILE, :headers => true) do |row|
  order_product = OrderProduct.new
  order_product.order_id = row['order_id']
  order_product.product_name = Product.find_by(name: row['product_name']).id
  order_product.quantity = row['quantity']
  successful = order_product.save
  if !successful
    orderproduct_failures << order_product
    puts "Failed to save order_product: #{order_product.inspect}"
  else
    puts "Created order_product: #{order_product.inspect}"
  end
end

puts "Added #{OrderProduct.count} order_product records"
puts "#{orderproduct_failures.length} order_product records failed to save"
