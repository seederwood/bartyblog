class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true
end
