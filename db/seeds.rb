# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# item = Item.create(:item_id => 'test2', :name => 'test2' ,:price => 2550, :description => 'test2' )
# item.image.attach(io: File.open(Rails.root.join('app/assets/images/test1.jpg')))
# item.save!

4.times do |n|
  item = Item.create!(
    item_id: "test#{n + 1}",
    name: "test#{n + 1}",
    price: 101 + n ,
    description: "test#{n + 1}",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/test#{n + 1}.jpg")), filename: "test#{n + 1}.jpg")
    )
end