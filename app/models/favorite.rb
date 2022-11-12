class Favorite < ApplicationRecord
belongs_to :user   # ユーザー/お気に入り → 1:多
belongs_to :question   # 記事/お気に入り    → 1:多

validates_uniqueness_of :question_id, scope: :user_id 
end
