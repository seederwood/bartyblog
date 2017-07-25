class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  has_attached_file :image, styles: { medium: '300x300>', large: '500x500>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.search(query)
    where('title LIKE ? or body LIKE ?', "%#{query}%", "%#{query}%")
  end
end
