class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :photo
  validates :content, presence: true
end
