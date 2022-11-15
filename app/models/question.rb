class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :content,:title, presence: true
  validates :tag_id, numericality: { other_than: 1 , message: "を選択してください"}

  belongs_to :tag
  belongs_to :user
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_many :comments,dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :bookmarks, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end


end
