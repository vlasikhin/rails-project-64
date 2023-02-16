class Post < ApplicationRecord
  belongs_to :category, inverse_of: :posts
  belongs_to :creator, class_name: "User"

  has_many :comments, class_name: "PostComment", dependent: :destroy
  has_many :likes, class_name: "PostLike", dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
