FactoryGirl.define do
  factory :post do
    author Faker::Book.author
    title Faker::ChuckNorris.fact
    content Faker::Lorem.paragraph
  end
end