# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed  

  def self.begin
    seed = Seed.new
    seed.generate_posts
  end

  def generate_posts
    20.times do |i|
      post = Post.create!(
        author: Faker::Book.author,
        title: Faker::ChuckNorris.fact,
        content: Faker::Lorem.paragraph
      )
    end
    puts "created posts"
  end
end

Seed.begin