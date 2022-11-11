class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  validates :content,:title, presence: true
  validates :tag_id, numericality: { other_than: 1 , message: "タグを選択してください"}


  belongs_to :user
  has_many_attached :images
end
