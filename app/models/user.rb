# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, foreign_key: :creator_id, inverse_of: :creator
  has_many :comments, class_name: 'PostComment', inverse_of: :user, dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  def username
    (name.presence || email.split('@').first).titleize
  end
end
