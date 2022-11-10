class Question < ApplicationRecord
  validates :content,:tag,:title, presence: true
  belongs_to :user
end
