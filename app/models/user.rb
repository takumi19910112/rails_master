class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2,:twitter, :facebook]

  validates :nickname, presence: true
   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

has_many :questions
has_many :favorites, dependent: :destroy
has_many :comments,dependent: :destroy
has_many :bookmarks, dependent: :destroy
has_many :sns_credentials

def self.from_omniauth(auth)
  sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  user = User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
    email: auth.info.email,
    first_name: auth.info.first_name,
    last_name: auth.info.last_name
  )
  if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
end
end
