class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:email]

  validates :nickname, presence: true
  validates :email, format: { with: /@/, message: 'は@を含む必要がある' }
  PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :password, format: { with: /[a-z\d]{6,}/, message: 'には6文字以上を含む必要がある' }
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :surname_furigana, presence: true, format: { with: /[ァ-ヶ]/, message: '全角カタカナを使用してください' }
  validates :name_furigana, presence: true, format: { with: /[ァ-ヶ]/, message: '全角カタカナを使用してください' }
  validates :birthday, presence: true
end
