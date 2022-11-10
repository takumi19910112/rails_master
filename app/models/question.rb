class Question < ApplicationRecord
  validates :content,:tag,:title,:images, presence: true
  belongs_to :user
  has_many_attached :images
end
