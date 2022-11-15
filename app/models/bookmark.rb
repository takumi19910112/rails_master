class Bookmark < ApplicationRecord
  validates :user_id, uniqueness: { scope: :question_id }
end
