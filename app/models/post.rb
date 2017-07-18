class Post < ApplicationRecord
  has_many :comments

  validates :content, presence: true

  def self.search(search)
    where("author LIKE ? OR content LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

  

end
