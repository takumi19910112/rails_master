class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

has_many :questions
has_many :favorites, dependent: :destroy
has_many :favorite_questions, through: :favorites, source: :question

# お気に入り関連のインスタンスメソッド
  # お気に入りをする
  def favorite(question)
    favorites_questions << question
  end

  #  お気に入りを解除する
  def unfavorite(board)
    favorites_questions.destroy(question)
  end

  # お気に入りしているかどうかを判定する
  def favorites?(question)
    favorites.where(question_id: question.id).exists?
  end
end
